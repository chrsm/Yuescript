<template>
  <div style="width: 100%; height: auto;">
    <div class="parent" style="background-color: #f5f7ff;">
      <div class="editor-section">
        <div class="childTitle">YueScript {{ info }}</div>
        <div class="editor-container">
          <textarea
            class="code-input"
            v-model="code"
            @input="codeChanged($event.target.value)"
            :readonly="readonly"
          ></textarea>
        </div>
      </div>
      <div class="editor-section">
        <div class="childTitle">Lua</div>
        <div class="editor-container">
          <pre class="code-output language-lua"><code v-html="highlightedLua"></code></pre>
        </div>
      </div>
    </div>
    <div v-if="!compileronly">
      <button class="button" @click="runCode()">Run!</button>
      <textarea class="resultArea" readonly>{{ result }}</textarea>
    </div>
  </div>
</template>

<script>
import 'prismjs/themes/prism.css'
import { highlight, languages } from 'prismjs/components/prism-core'
import 'prismjs/components/prism-moonscript'
import 'prismjs/components/prism-lua'

export default {
  props: {
    compileronly: {
      type: Boolean,
      default: false
    },
    displayonly: {
      type: Boolean,
      default: false
    },
    text: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      info: 'Loading',
      readonly: true,
      code: '',
      compiled: '',
      result: '',
      windowWidth: 0
    }
  },
  computed: {
    isMobileLayout() {
      return this.windowWidth <= 768
    },
    highlightedLua() {
      return highlight(this.compiled || '', languages.lua)
    }
  },
  mounted() {
    this.windowWidth = window.innerWidth
    window.addEventListener('resize', this.handleResize)

    if (this.text !== '') {
      this.code = this.text
      this.codeChanged(this.text)
    }

    const check = ((self) => {
      return () => {
        if (window.yue) {
          self.info = window.yue.version()
          self.readonly = false
          if (this.code !== '') {
            this.codeChanged(this.code)
          }
        } else {
          setTimeout(check, 100)
        }
      }
    })(this)
    check()
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.handleResize)
  },
  methods: {
    handleResize() {
      this.windowWidth = window.innerWidth
    },
    runCode() {
      if (window.yue && this.compiled !== '') {
        let res = ''
        try {
          res = window.yue.exec(this.code)
        } catch (err) {
          res = err
        }
        this.result = res
      }
    },
    codeChanged(text) {
      if (window.yue) {
        let res = [
          '',
          'compiler error, and please help opening an issue for this. Thanks a lot!'
        ]
        try {
          res = window.yue.tolua(text, true, !this.displayonly, true)
          if (res[0] !== '') {
            this.compiled = res[0]
          } else {
            this.compiled = res[1]
          }
        } catch (error) {
          this.compiled = res[1]
        }
      }
    }
  }
}
</script>

<style scoped>
.resultArea {
  float: left;
  margin-right: 1em;
  overflow: scroll;
  overflow-wrap: break-word;
  width: calc(100% - 120px);
  height: 55px;
  border-color: #b7ae8f;
  outline: none;
  resize: none;
  margin-top: 5px;
}

.parent {
  display: flex;
  flex-wrap: wrap;
  width: 100%;
}

.editor-section {
  width: 50%;
  box-sizing: border-box;
  background: #f5f7ff;
}

.editor-container {
  height: 55vh;
}

.childTitle {
  width: 100%;
  font-size: 1.2em;
  color: #b7ae8f;
  text-align: center;
  padding: 0.2em;
  height: 2.5em;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button {
  float: right;
  border: none;
  display: inline-block;
  font-size: 1.2rem;
  color: #fff;
  background-color: #b7ae8f;
  text-decoration: none;
  padding: 0.8rem 1.6rem;
  border-radius: 4px;
  transition: background-color 0.1s ease;
  box-sizing: border-box;
  border-bottom: 1px solid #aaa07b;
  margin-top: 10px;
  margin-right: 5px;
}

.button:hover {
  background-color: #beb69a;
}

.button:focus,
.button:active:focus,
.button.active:focus,
.button.focus,
.button:active.focus {
  outline: none;
}

.code-input {
  width: 100%;
  height: 100%;
  border: none;
  resize: none;
  padding: 12px;
  font-family: Consolas, Menlo, Monaco, 'Andale Mono WT', 'Andale Mono',
    'Lucida Console', 'Lucida Sans Typewriter', 'DejaVu Sans Mono',
    'Bitstream Vera Sans Mono', 'Liberation Mono', 'Nimbus Mono L', 'Courier New',
    Courier, monospace;
  line-height: 1.375;
  background: #f5f7ff;
  color: #5e6687;
  font-size: 15px;
  outline: none;
}

.code-output {
  margin: 0;
  height: 100%;
  overflow: auto;
  padding: 12px;
  background: #f5f7ff;
  color: #5e6687;
  font-size: 15px;
}

@media screen and (max-width: 768px) {
  .parent {
    flex-direction: column;
  }

  .editor-section {
    width: 100%;
  }

  .editor-container {
    height: 30vh;
  }
}
</style>
