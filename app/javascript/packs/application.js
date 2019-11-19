import 'bulma'
import 'trix'
import 'trix/dist/trix.css'
import '@rails/actiontext'
import 'bulma-quickview/dist/css/bulma-quickview.min'

import '../stylesheets/actiontext.scss'

import UJS from '@rails/ujs'
import Vue from 'vue/dist/vue.esm'
import Turbolinks from 'turbolinks'
import Bulma from '@vizuaalog/bulmajs';
import TurbolinksAdapter from 'vue-turbolinks'

import PresentationEditor from '../PresentationEditor.vue'

UJS.start()
Turbolinks.start()

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const element = document.getElementById("app")
  const props = JSON.parse(element.getAttribute('data'))

  if (element != null && props != null) {
    const app = new Vue({
      el: '#app',

      data: () => {
        return {
          message: "Can you say hello?"
        }
      },

      render: h => h(PresentationEditor, { props }),
    })
  }
})
