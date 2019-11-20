<template>
  <div class="container">
    <draggable
      :list="list"
      tag="div"
      class="columns is-centered"
      @start="dragging = true"
      @end="dragging = false"
    >
      <div
        v-for="(slide, index) in list"
        :key="index"
        class="column is-2"
      >
        <figure
          class="image thumbnail is-3by2"
          :class="{ 'is-active': selected == index }"
          @click="$emit('selected', index)"
        >
          <img :src="slide.url" alt="slide">
        </figure>
      </div>
    </draggable>
  </div>
</template>

<script>
import draggable from 'vuedraggable'

export default {
  props: {
    slides: {
      type: Array,
      required: true
    },

    selected: {
      type: Number,
      required: true,
    },
  },

  components: {
    draggable,
  },

  data() {
    return {
      dragging: false,
      list: this.slides.map((url, index) => {
        return { url: url, position: index + 1 }
      }),
    }
  },
}
</script>

<style lang="scss">
  .image.is-active {
    box-shadow: 0px 2px 10px 0px rgba(0,0,0,0.75);
  }
</style>
