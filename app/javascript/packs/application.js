import 'bulma'
import 'trix'
import 'trix/dist/trix.css'
import '@rails/actiontext'
import 'bulma-quickview/dist/css/bulma-quickview.min'

import '../stylesheets/actiontext.scss'

import '../common/trix.js'

import UJS from '@rails/ujs'
import Vue from 'vue/dist/vue.esm'
import Turbolinks from 'turbolinks'
import Bulma from '@vizuaalog/bulmajs';
import TurbolinksAdapter from 'vue-turbolinks'
import Notifications from '../common/notifications.js'

import QuickView from '../components/QuickView'
import PresentationEditor from '../PresentationEditor.vue'

UJS.start()
Turbolinks.start()

Vue.use(TurbolinksAdapter)

Vue.component('quickview', QuickView)

document.addEventListener('turbolinks:load', () => {
  Notifications.start()

  const app = new Vue({
    el: '[data-vue]',

    components: {
      PresentationEditor,
    },
  })
})
