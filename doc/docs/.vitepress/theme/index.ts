import DefaultTheme from 'vitepress/theme'
import './custom.css'

import CompilerModal from './components/CompilerModal.vue'
import YueCompiler from './components/YueCompiler.vue'
import YueDisplay from './components/YueDisplay.vue'

export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    app.component('CompilerModal', CompilerModal)
    app.component('YueCompiler', YueCompiler)
    app.component('YueDisplay', YueDisplay)
  }
}
