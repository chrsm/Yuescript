<template>
  <div v-if="isOpen" class="modal-backdrop" @click.self="close">
    <div class="modal-body">
      <button class="modal-close" type="button" @click="close">×</button>
      <YueCompiler :text="content" compileronly displayonly />
    </div>
  </div>
</template>

<script>
import YueCompiler from './YueCompiler.vue'

export default {
  components: {
    YueCompiler
  },
  data() {
    return {
      isOpen: false,
      content: ''
    }
  },
  mounted() {
    this.handleOpen = (event) => {
      this.content = event?.detail || ''
      this.isOpen = true
    }
    window.addEventListener('yue:open-compiler', this.handleOpen)
  },
  beforeUnmount() {
    window.removeEventListener('yue:open-compiler', this.handleOpen)
  },
  methods: {
    close() {
      this.isOpen = false
    }
  }
}
</script>

<style scoped>
.modal-backdrop {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.6);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 2000;
}

.modal-body {
  position: relative;
  width: min(90vw, 1100px);
  max-height: 90vh;
  overflow: auto;
  background: #ffffff;
  border-radius: 8px;
  padding: 16px;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
}

.modal-close {
  position: sticky;
  top: 0;
  margin-left: auto;
  border: none;
  background: transparent;
  font-size: 24px;
  cursor: pointer;
  color: #444;
}
</style>
