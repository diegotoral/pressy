<template>
  <div class="columns is-centered">
    <div
      v-for="(slide, index) in slides"
      class="column is-2"
    >
      <figure
        class="image is-3by2"
        :class="{ 'is-active': selected == index }"
        @click="$emit('selected', index)"
      >
        <img :src="slide" alt="slide">
      </figure>
    </div>
  </div>
</template>

<script>
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
}
</script>

<style lang="scss">
  .image.is-active {
    box-shadow: 0px 2px 10px 0px rgba(0,0,0,0.75);
  }
</style>
