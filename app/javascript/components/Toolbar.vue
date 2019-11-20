<template>
  <div class="level toolbar">
    <div class="level-left">
      <div class="level-item">
        <nav class="breadcrumb is-small" aria-label="breadcrumbs">
          <ul>
            <li><a href="#">Presentations</a></li>
            <li class="is-active">
              <a href="#">{{ presentation.name }}</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>

    <div class="level-right">
      <div class="level-item">
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
      </div>
    </div>

    <OptionsForm ref="options" :presentation="presentation" />
  </div>
</template>

<script>
import OptionsForm from './OptionsForm'

export default {
  props: {
    presentation: {
      type: Object,
      required: true,
    },
  },

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

<style lang="scss">
.toolbar {
  margin-top: 15px;
}
</style>
