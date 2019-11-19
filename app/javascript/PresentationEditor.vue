<template>
  <div class="presentation-editor">
    <div class="toolbar">
      <div class="container">
        <nav class="breadcrumb is-small has-dot-separator">
          <ul>
            <li><a :href="urls.presentations">Presentations</a></li>
            <li class="is-active"><a href="#">{{ name }}</a></li>
          </ul>
        </nav>

        <Toolbar />
      </div>
    </div>

    <div class="slide">
      <div class="container">
        <div class="column is-8 is-offset-2">
          <figure class="image is-3by2">
            <img :src="currentSlide" alt="slide">
          </figure>
        </div>
      </div>
    </div>

    <div class="timeline">
      <div class="container">
        <Timeline
          :slides="slides"
          :selected="selectedSlide"
          @selected="selectSlide"
        />
      </div>
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
