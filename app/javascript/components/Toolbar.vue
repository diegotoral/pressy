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

<style lang="scss">
.toolbar {
  margin-top: 15px;
}
</style>
