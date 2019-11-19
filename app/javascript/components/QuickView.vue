<template>
  <div class="quickview" :class="{ 'is-active': isActive }">
    <header class="quickview-header">
      <p class="title">{{ title }}</p>
      <span
        class="delete"
        @click="toggle"
      ></span>
    </header>

    <div class="quickview-body">
      <div class="quickview-block">
        <slot />
      </div>
    </div>

    <footer class="quickview-footer">
      <slot name="actions" />
    </footer>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      default: null,
    },
  },

  data() {
    return {
      isActive: false,
    }
  },

  methods: {
    toggle() {
      this.isActive = !this.isActive
    },
  },
}
</script>

<style lang="scss">
.quickview-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 1rem;
  min-height: 3.25em!important;
}
</style>
