import 'bulma'
import 'trix'
import 'trix/dist/trix.css'
import '@rails/actiontext'

import '../stylesheets/actiontext.scss'

import UJS from '@rails/ujs'
import Vue from 'vue/dist/vue.esm'
import Turbolinks from 'turbolinks'
import TurbolinksAdapter from 'vue-turbolinks'
import Notifications from '../common/notifications'

import App from '../app.vue'

UJS.start()
Turbolinks.start()

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  const element = document.getElementById("app")
  const props = JSON.parse(element.getAttribute('data'))

  Notifications.start()

  if (element != null && props != null) {
    const app = new Vue({
      el: '#app',

      data: () => {
        return {
          message: "Can you say hello?"
        }
      },

      render: h => h(App, { props }),
    })
  }
})
