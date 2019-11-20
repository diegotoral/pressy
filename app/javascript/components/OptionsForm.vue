<script>
import QuickView from './QuickView'

export default {
  props: {
    presentation: {
      type: Object,
      required: true,
    },
  },

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
