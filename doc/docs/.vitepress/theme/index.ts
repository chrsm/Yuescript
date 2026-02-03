import DefaultTheme from 'vitepress/theme'
import type { Theme } from 'vitepress'
import './custom.css'

// @ts-ignore
import CompilerModal from './components/CompilerModal.vue'
// @ts-ignore
import YueCompiler from './components/YueCompiler.vue'
// @ts-ignore
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
