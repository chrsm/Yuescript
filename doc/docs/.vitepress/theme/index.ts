import DefaultTheme from 'vitepress/theme'
import { h } from 'vue'
import './custom.css'

import CompilerModal from './components/CompilerModal.vue'
import YueCompiler from './components/YueCompiler.vue'
import YueDisplay from './components/YueDisplay.vue'

export default {
  extends: DefaultTheme,
  Layout: () =>
    h(DefaultTheme.Layout, null, {
      'layout-bottom': () => h(CompilerModal)
    }),
  enhanceApp({ app }) {
    app.component('CompilerModal', CompilerModal)
    app.component('YueCompiler', YueCompiler)
    app.component('YueDisplay', YueDisplay)
  }
}
