import DefaultTheme from "vitepress/theme";
import type { Theme } from "vitepress";
import { useRoute } from "vitepress";
import { h, nextTick, watch } from "vue";
import "./custom.css";
import darkPlus from "@shikijs/themes/dark-plus";
import lightPlus from "@shikijs/themes/light-plus";
import yuescriptGrammar from "../grammars/yuescript.tmLanguage.json";

// @ts-ignore
import CompilerModal from "./components/CompilerModal.vue";
// @ts-ignore
import HomeFooter from "./components/HomeFooter.vue";
// @ts-ignore
import YueCompiler from "./components/YueCompiler.vue";
// @ts-ignore
import YueDisplay from "./components/YueDisplay.vue";

type ShikiHighlighter = Awaited<
  ReturnType<(typeof import("shiki/core"))["createHighlighterCore"]>
>;

let shikiHighlighterPromise: Promise<ShikiHighlighter> | null = null;
let shikiRepairQueued = false;
let shikiRepairRetry1 = 0;
let shikiRepairRetry2 = 0;

type SupportedLanguage = "yuescript" | "lua" | "shellscript";

function toSupportedLanguage(className: string): SupportedLanguage | null {
  const match = className.match(/(?:^|\s)language-([a-z0-9_-]+)/i);
  if (!match) return null;
  const lang = match[1].toLowerCase();
  if (lang === "yuescript" || lang === "yue") return "yuescript";
  if (lang === "lua") return "lua";
  if (
    lang === "shellscript" ||
    lang === "shell" ||
    lang === "bash" ||
    lang === "sh" ||
    lang === "zsh"
  ) {
    return "shellscript";
  }
  return null;
}

function getShikiHighlighter() {
  if (!shikiHighlighterPromise) {
    shikiHighlighterPromise = Promise.all([
      import("shiki/core"),
      import("shiki/engine/javascript"),
      import("@shikijs/langs/lua"),
      import("@shikijs/langs/shellscript"),
    ]).then(
      ([
        { createHighlighterCore },
        { createJavaScriptRegexEngine },
        luaLang,
        shellscriptLang,
      ]) =>
      createHighlighterCore({
        themes: [lightPlus, darkPlus],
        langs: [
          {
            ...yuescriptGrammar,
            name: "yuescript",
            scopeName: "source.yuescript",
            aliases: ["yue"],
          },
          ...luaLang.default,
          ...shellscriptLang.default,
        ],
        engine: createJavaScriptRegexEngine(),
      }),
    );
  }
  return shikiHighlighterPromise;
}

function collectPlainCodeTargets() {
  if (typeof document === "undefined") return [];
  const nodes = Array.from(
    document.querySelectorAll<HTMLElement>(
      "pre > code[class*='language-'], code[class*='language-']",
    ),
  );
  return nodes.filter((code) => {
    if (code.closest("pre.shiki")) return false;
    const pre = code.parentElement;
    if (pre && pre.tagName === "PRE" && pre.classList.contains("shiki")) {
      return false;
    }
    return toSupportedLanguage(code.className) !== null;
  });
}

async function repairPlainCodeBlocks() {
  const targets = collectPlainCodeTargets();
  if (!targets.length) return;

  const highlighter = await getShikiHighlighter();

  for (const code of targets) {
    const lang = toSupportedLanguage(code.className);
    if (!lang) continue;
    const source = (code.textContent || "").replace(/\r\n?/g, "\n");
    if (!source.trim()) continue;
    const html = highlighter.codeToHtml(source, {
      lang,
      themes: {
        light: "light-plus",
        dark: "dark-plus",
      },
    });
    const tpl = document.createElement("template");
    tpl.innerHTML = html.trim();
    const replacement = tpl.content.firstElementChild as HTMLElement | null;
    if (!replacement) continue;
    replacement.classList.add("vp-code");
    const pre = code.parentElement?.tagName === "PRE" ? code.parentElement : null;
    (pre || code).replaceWith(replacement);
  }

  applyShikiInlineColorFallback();
}

function scheduleShikiRepair() {
  if (typeof window === "undefined") return;
  if (shikiRepairQueued) return;
  shikiRepairQueued = true;
  window.requestAnimationFrame(() => {
    shikiRepairQueued = false;
    void repairPlainCodeBlocks();
  });
}

function scheduleShikiRepairWithRetries() {
  if (typeof window === "undefined") return;
  scheduleShikiRepair();
  window.clearTimeout(shikiRepairRetry1);
  window.clearTimeout(shikiRepairRetry2);
  shikiRepairRetry1 = window.setTimeout(scheduleShikiRepair, 120);
  shikiRepairRetry2 = window.setTimeout(scheduleShikiRepair, 500);
}

function applyShikiInlineColorFallback() {
  if (typeof document === "undefined") return;
  const isDark = document.documentElement.classList.contains("dark");
  const varName = isDark ? "--shiki-dark" : "--shiki-light";
  const spans = document.querySelectorAll<HTMLElement>(".vp-code span");
  spans.forEach((span) => {
    const color = span.style.getPropertyValue(varName).trim();
    if (color) {
      span.style.color = color;
    }
  });
}

const theme: Theme = {
  extends: DefaultTheme,
  Layout: () =>
    h(DefaultTheme.Layout, null, {
      "layout-bottom": () => [h(HomeFooter), h(CompilerModal)],
    }),
  setup() {
    if (typeof window === "undefined") return;
    const route = useRoute();
    watch(
      () => route.path,
      async () => {
        await nextTick();
        scheduleShikiRepairWithRetries();
      },
      { immediate: true },
    );
  },
  enhanceApp({ app }) {
    app.component("CompilerModal", CompilerModal);
    app.component("YueCompiler", YueCompiler);
    app.component("YueDisplay", YueDisplay);

    if (typeof window !== "undefined") {
      const run = () => {
        requestAnimationFrame(applyShikiInlineColorFallback);
        scheduleShikiRepairWithRetries();
      };
      window.addEventListener("DOMContentLoaded", run, { once: true });
      window.addEventListener("load", run, { once: true });

      const observer = new MutationObserver(run);
      observer.observe(document.documentElement, {
        attributes: true,
        attributeFilter: ["class"],
      });
    }
  },
};

export default theme;
