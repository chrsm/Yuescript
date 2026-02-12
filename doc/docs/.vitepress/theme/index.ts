import DefaultTheme from "vitepress/theme";
import type { Theme } from "vitepress";
import { h } from "vue";
import "./custom.css";

// @ts-ignore
import CompilerModal from "./components/CompilerModal.vue";
// @ts-ignore
import HomeFooter from "./components/HomeFooter.vue";
// @ts-ignore
import YueCompiler from "./components/YueCompiler.vue";
// @ts-ignore
import YueDisplay from "./components/YueDisplay.vue";

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
  enhanceApp({ app }) {
    app.component("CompilerModal", CompilerModal);
    app.component("YueCompiler", YueCompiler);
    app.component("YueDisplay", YueDisplay);

    if (typeof window !== "undefined") {
      const run = () => requestAnimationFrame(applyShikiInlineColorFallback);
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
