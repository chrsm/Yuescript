import { defineConfig } from 'vitepress'
import { resolve, dirname } from 'path'
import { readFileSync } from 'fs'
import { fileURLToPath } from 'url'
import lightPlus from '@shikijs/themes/light-plus'
import darkPlus from '@shikijs/themes/dark-plus'

const __dirname = dirname(fileURLToPath(import.meta.url))
const moonscriptGrammarPath = resolve(__dirname, 'grammars/moonscript.tmLanguage.json')
const moonscriptGrammar = JSON.parse(readFileSync(moonscriptGrammarPath, 'utf-8'))
const moonscriptLanguage = {
  ...moonscriptGrammar,
  name: 'moonscript',
  scopeName: 'source.moonscript',
  aliases: ['yue', 'yuescript', 'moon'],
}

export default defineConfig({
  title: 'YueScript',
  description: 'A language that compiles to Lua',
  base: '/',
  head: [
    ['meta', { name: 'theme-color', content: '#b4ac8f' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'black' }],
    ['meta', { property: 'og:title', content: 'YueScript' }],
    ['meta', { property: 'og:description', content: 'A language that compiles to Lua' }],
    ['meta', { property: 'og:type', content: 'website' }],
    ['meta', { property: 'og:image', content: '/image/yuescript.png' }],
    ['meta', { property: 'og:image:secure_url', content: '/image/yuescript.png' }],
    ['meta', { property: 'og:image:type', content: 'image/png' }],
    ['meta', { property: 'og:image:width', content: '1200' }],
    ['meta', { property: 'og:image:height', content: '1200' }],
    ['link', { rel: 'icon', href: '/image/favicon/favicon-16x16.png', sizes: '16x16', type: 'image/png' }],
    ['link', { rel: 'icon', href: '/image/favicon/favicon-32x32.png', sizes: '32x32', type: 'image/png' }],
    ['link', { rel: 'apple-touch-icon', href: '/image/favicon/apple-touch-icon.png', sizes: '180x180', type: 'image/png' }],
    ['link', { rel: 'android-chrome', href: '/image/favicon/android-chrome-192x192.png', sizes: '192x192', type: 'image/png' }],
    ['link', { rel: 'android-chrome', href: '/image/favicon/android-chrome-512x512.png', sizes: '512x512', type: 'image/png' }],
    ['script', {}, 'window.global = window;'],
    [
      'script',
      {},
      `var Module = {
  onRuntimeInitialized: function() {
    window.yue = Module;
    window.dispatchEvent(new Event('yue:ready'));
  }
};
(function() {
  function loadStub() {
    window.yue = {
      version: function() { return '(build with: make wasm)'; },
      tolua: function() { return ['', 'Build yuescript wasm with: make wasm']; },
      exec: function() { return ''; }
    };
    window.dispatchEvent(new Event('yue:ready'));
  }
  var s = document.createElement('script');
  s.src = '/js/yuescript.js';
  s.async = true;
  document.head.appendChild(s);
})();`
    ]
  ],
  vite: {
    publicDir: resolve(__dirname, 'public'),
  },
  markdown: {
    languages: [
      moonscriptLanguage,
    ],
    theme: {
      light: lightPlus,
      dark: darkPlus,
    },
  },
  locales: {
    root: {
      label: 'English',
      lang: 'en-US',
      description: 'A language that compiles to Lua',
      themeConfig: {
        nav: [
          { text: 'Document', link: '/doc/' },
          { text: 'Try yue!', link: '/try/' },
          { text: 'Github', link: 'https://github.com/IppClub/Yuescript' }
        ]
      }
    },
    zh: {
      label: '简体中文',
      lang: 'zh-CN',
      description: '一门编译到 Lua 的语言',
      themeConfig: {
        nav: [
          { text: '文档', link: '/zh/doc/' },
          { text: '试一试!', link: '/zh/try/' },
          { text: 'Github', link: 'https://github.com/IppClub/Yuescript' }
        ]
      }
    }
  }
})
