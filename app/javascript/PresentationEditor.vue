<template>
  <div class="hero is-fullheight-with-navbar">
    <div class="hero-head">
      <div class="container">
        <Toolbar :presentation="{ name: 'Test 123' }" />
      </div>
    </div>

    <div class="hero-body preview">
      <div class="container">
        <div class="column is-8 is-offset-2">
          <figure class="image is-3by2">
            <img :src="currentSlide" alt="slide">
          </figure>
        </div>
      </div>
    </div>

    <div class="hero-foot timeline">
      <Timeline
        :slides="slides"
        :selected="selectedSlide"
        @selected="selectSlide"
      />
    </div>
  </div>

</template>

<script>
  import Toolbar from 'components/Toolbar'
  import Timeline from 'components/Timeline'

  export default {
    props: {
      name: {
        type: String,
        default: 'No name',
      },

      slides: {
        type: Array,
        default: [],
      },

      urls: {
        type: Object,
        default: {}
      }
    },

    components: {
      Toolbar,
      Timeline,
    },

    data() {
      return { selectedSlide: 0 }
    },

    computed: {
      currentSlide() {
        return this.slides[this.selectedSlide]
      },
    },

    methods: {
      selectSlide(index) {
        this.selectedSlide = index
      },
    },
  }
</script>

<style lang="scss">
.preview {
  align-items: baseline;
}

.timeline {
  position: fixed;
  bottom: 10px;
  left: 0;
  right: 0;
}
</style>
