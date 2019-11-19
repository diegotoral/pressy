<template>
  <QuickView
    ref="view"
    title="Presentation Options"
  >
    <template #default>
      <section class="section">
        <div class="field">
          <label for="" class="label">Name</label>
          <div class="control"><input type="text" class="input"></div>
        </div>

        <div class="field">
          <label for="" class="label">Description</label>
          <div class="control">
            <textarea type="text" class="textarea" rows="15"></textarea>
          </div>
        </div>
      </section>
    </template>

    <template #actions>
      <div class="field">
        <div class="control">
          <button class="button is-info is-small is-rounded">Save</button>
          <button class="button is-white is-small is-rounded">Cancel</button>
        </div>
      </div>
    </template>
  </QuickView>
</template>

<script>
import QuickView from './QuickView'

export default {
  components: {
    QuickView,
  },

  methods: {
    toggle() {
      this.$refs.view.toggle()
    },
  },
}
</script>
