import DefaultTheme from 'vitepress/theme'
import type { Theme } from 'vitepress'
import './custom.css'

import CompilerModal from './components/CompilerModal.vue'
import YueCompiler from './components/YueCompiler.vue'
import YueDisplay from './components/YueDisplay.vue'

const theme: Theme = {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    app.component('CompilerModal', CompilerModal)
    app.component('YueCompiler', YueCompiler)
    app.component('YueDisplay', YueDisplay)
  }
}

export default theme
