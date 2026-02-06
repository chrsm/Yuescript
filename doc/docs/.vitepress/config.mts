import { readFileSync } from 'fs';
import {
  dirname,
  resolve,
} from 'path';
import { fileURLToPath } from 'url';
import { defineConfig } from 'vitepress';

import darkPlus from '@shikijs/themes/dark-plus';
import lightPlus from '@shikijs/themes/light-plus';

const __dirname = dirname(fileURLToPath(import.meta.url))
const yuescriptGrammarPath = resolve(__dirname, 'grammars/yuescript.tmLanguage.json')
const yuescriptGrammar = JSON.parse(readFileSync(yuescriptGrammarPath, 'utf-8'))
const yuescriptLanguage = {
  ...yuescriptGrammar,
  name: 'yuescript',
  scopeName: 'source.yuescript',
  aliases: ['yue'],
}

const sidebarText = {
  en: {
    introduction: 'Introduction',
    installation: 'Installation',
    usage: 'Usage',
    macro: 'Macro',
    operator: 'Operator',
    module: 'Module',
    assignment: 'Assignment',
    destructuringAssignment: 'Destructuring Assignment',
    ifAssignment: 'If Assignment',
    varargsAssignment: 'Varargs Assignment',
    whitespace: 'Whitespace',
    comment: 'Comment',
    try: 'Try',
    attributes: 'Attributes',
    literals: 'Literals',
    functionLiterals: 'Function Literals',
    backcalls: 'Backcalls',
    tableLiterals: 'Table Literals',
    comprehensions: 'Comprehensions',
    forLoop: 'For Loop',
    whileLoop: 'While Loop',
    continueStatement: 'Continue Statement',
    conditionals: 'Conditionals',
    lineDecorators: 'Line Decorators',
    switch: 'Switch',
    objectOrientedProgramming: 'Object Oriented Programming',
    withStatement: 'With Statement',
    do: 'Do',
    functionStubs: 'Function Stubs',
    usingClause: 'The Using Clause; Controlling Destructive Assignment',
    yuescriptLibrary: 'The YueScript Library',
    licenseMit: 'License: MIT',
  },
  zh: {
    introduction: '介绍',
    installation: '安装',
    usage: '使用方法',
    macro: '宏',
    operator: '操作符',
    module: '模块',
    assignment: '赋值',
    destructuringAssignment: '解构赋值',
    ifAssignment: 'if 赋值',
    varargsAssignment: '可变参数赋值',
    whitespace: '空白',
    comment: '注释',
    try: '错误处理',
    attributes: '属性',
    literals: '字面量',
    functionLiterals: '函数字面量',
    backcalls: '反向回调',
    tableLiterals: '表格字面量',
    comprehensions: '推导式',
    forLoop: 'for 循环',
    whileLoop: 'while 循环',
    continueStatement: 'continue 语句',
    conditionals: '条件语句',
    lineDecorators: '代码行修饰符',
    switch: 'switch 语句',
    objectOrientedProgramming: '面向对象编程',
    withStatement: 'with 语句',
    do: 'do 语句',
    functionStubs: '函数存根',
    usingClause: '使用 using 语句：防止破坏性赋值',
    yuescriptLibrary: '月之脚本语言库',
    licenseMit: 'MIT 许可证',
  },
  de: {
    introduction: 'Einführung',
    installation: 'Installation',
    usage: 'Verwendung',
    macro: 'Makro',
    operator: 'Operatoren',
    module: 'Modul',
    assignment: 'Zuweisung',
    destructuringAssignment: 'Destrukturierende Zuweisung',
    ifAssignment: 'If-Zuweisung',
    varargsAssignment: 'Varargs-Zuweisung',
    whitespace: 'Leerraum',
    comment: 'Kommentare',
    try: 'Try/Catch',
    attributes: 'Attribute',
    literals: 'Literale',
    functionLiterals: 'Funktionsliterale',
    backcalls: 'Backcalls',
    tableLiterals: 'Tabellenliterale',
    comprehensions: 'Comprehensions',
    forLoop: 'For-Schleife',
    whileLoop: 'While-Schleife',
    continueStatement: 'Continue-Anweisung',
    conditionals: 'Bedingungen',
    lineDecorators: 'Zeilen-Dekoratoren',
    switch: 'Switch',
    objectOrientedProgramming: 'Objektorientierte Programmierung',
    withStatement: 'With-Anweisung',
    do: 'Do',
    functionStubs: 'Funktions-Stubs',
    usingClause: 'Die Using-Klausel; Kontrolle destruktiver Zuweisung',
    yuescriptLibrary: 'Die YueScript-Bibliothek',
    licenseMit: 'Lizenz: MIT',
  },
  ptBr: {
    introduction: 'Introdução',
    installation: 'Instalação',
    usage: 'Uso',
    macro: 'Macro',
    operator: 'Operadores',
    module: 'Módulo',
    assignment: 'Atribuição',
    destructuringAssignment: 'Atribuição com desestruturação',
    ifAssignment: 'Atribuição com if',
    varargsAssignment: 'Atribuição de varargs',
    whitespace: 'Espaços em branco',
    comment: 'Comentários',
    try: 'Try/Catch',
    attributes: 'Atributos',
    literals: 'Literais',
    functionLiterals: 'Literais de função',
    backcalls: 'Backcalls',
    tableLiterals: 'Literais de tabela',
    comprehensions: 'Compreensões',
    forLoop: 'Laço for',
    whileLoop: 'Laço while',
    continueStatement: 'Instrução continue',
    conditionals: 'Condicionais',
    lineDecorators: 'Decoradores de linha',
    switch: 'Switch',
    objectOrientedProgramming: 'Programação orientada a objetos',
    withStatement: 'Instrução with',
    do: 'Do',
    functionStubs: 'Stubs de função',
    usingClause: 'Cláusula using; controlando atribuição destrutiva',
    yuescriptLibrary: 'A biblioteca do YueScript',
    licenseMit: 'Licença: MIT',
  },
} as const

type SidebarLocale = keyof typeof sidebarText

function createSidebar(basePath: string, locale: SidebarLocale) {
  const text = sidebarText[locale]
  return [
    { text: text.introduction, link: `${basePath}/introduction` },
    { text: text.installation, link: `${basePath}/installation` },
    { text: text.usage, link: `${basePath}/usage` },
    { text: text.macro, link: `${basePath}/macro` },
    { text: text.operator, link: `${basePath}/operator` },
    { text: text.module, link: `${basePath}/module` },
    { text: text.assignment, link: `${basePath}/assignment` },
    { text: text.destructuringAssignment, link: `${basePath}/destructuring-assignment` },
    { text: text.ifAssignment, link: `${basePath}/if-assignment` },
    { text: text.varargsAssignment, link: `${basePath}/varargs-assignment` },
    { text: text.whitespace, link: `${basePath}/whitespace` },
    { text: text.comment, link: `${basePath}/comment` },
    { text: text.try, link: `${basePath}/try` },
    { text: text.attributes, link: `${basePath}/attributes` },
    { text: text.literals, link: `${basePath}/literals` },
    { text: text.functionLiterals, link: `${basePath}/function-literals` },
    { text: text.backcalls, link: `${basePath}/backcalls` },
    { text: text.tableLiterals, link: `${basePath}/table-literals` },
    { text: text.comprehensions, link: `${basePath}/comprehensions` },
    { text: text.forLoop, link: `${basePath}/for-loop` },
    { text: text.whileLoop, link: `${basePath}/while-loop` },
    { text: text.continueStatement, link: `${basePath}/continue` },
    { text: text.conditionals, link: `${basePath}/conditionals` },
    { text: text.lineDecorators, link: `${basePath}/line-decorators` },
    { text: text.switch, link: `${basePath}/switch` },
    { text: text.objectOrientedProgramming, link: `${basePath}/object-oriented-programming` },
    { text: text.withStatement, link: `${basePath}/with-statement` },
    { text: text.do, link: `${basePath}/do` },
    { text: text.functionStubs, link: `${basePath}/function-stubs` },
    { text: text.usingClause, link: `${basePath}/the-using-clause-controlling-destructive-assignment` },
    { text: text.yuescriptLibrary, link: `${basePath}/the-yuescript-library` },
    { text: text.licenseMit, link: `${basePath}/licence-mit` },
  ]
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
      yuescriptLanguage,
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
          { text: 'GitHub', link: 'https://github.com/IppClub/Yuescript' }
        ],
        sidebar: createSidebar('/doc', 'en'),
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
          { text: 'GitHub', link: 'https://github.com/IppClub/Yuescript' }
        ],
        sidebar: createSidebar('/zh/doc', 'zh'),
      }
    },
    de: {
      label: 'Deutsch',
      lang: 'de-DE',
      description: 'Eine Sprache, die zu Lua kompiliert',
      themeConfig: {
        nav: [
          { text: 'Dokumentation', link: '/de/doc/' },
          { text: 'Yue ausprobieren!', link: '/de/try/' },
          { text: 'GitHub', link: 'https://github.com/IppClub/Yuescript' }
        ],
        sidebar: createSidebar('/de/doc', 'de'),
      }
    },
    'pt-br': {
      label: 'Português (Brasil)',
      lang: 'pt-BR',
      description: 'Uma linguagem que compila para Lua',
      themeConfig: {
        nav: [
          { text: 'Documentação', link: '/pt-br/doc/' },
          { text: 'Experimente Yue!', link: '/pt-br/try/' },
          { text: 'GitHub', link: 'https://github.com/IppClub/Yuescript' }
        ],
        sidebar: createSidebar('/pt-br/doc', 'ptBr'),
      }
    }
  },
  themeConfig: {
    search: {
      provider: 'local'
    }
  }
})
