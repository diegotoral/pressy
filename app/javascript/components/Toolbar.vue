<template>
  <div>
    <div class="field has-addons">
      <p class="control">
        <button class="button is-small is-rounded">
          <span class="icon is-small">
            <i class="fas fa-microphone"></i>
          </span>
          <span>Record audio</span>
        </button>
      </p>

      <p class="control">
        <button class="button is-small is-rounded">
          <span class="icon is-small">
            <i class="far fa-image"></i>
          </span>
          <span>Change background</span>
        </button>
      </p>

      <p class="control">
        <button class="button is-small is-rounded">
          <span class="icon is-small">
            <i class="fas fa-bolt"></i>
          </span>
          <span>Interactivity</span>
        </button>
      </p>

      <p class="control">
        <button
          class="button is-small is-rounded"
          @click.prevent="showOptions"
        >
          <span class="icon is-small">
            <i class="fas fa-cog"></i>
          </span>
        </button>
      </p>

    </div>

    <OptionsForm ref="options" />
  </div>
</template>

<script>
import OptionsForm from './OptionsForm'

export default {
  components: {
    OptionsForm,
  },

  methods: {
    showOptions() {
      this.$refs.options.toggle()
    },
  },
}
</script>
