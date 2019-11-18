import 'bulma'
import 'trix'
import 'trix/dist/trix.css'
import '@rails/actiontext'

import '../stylesheets/actiontext.scss'

import UJS from '@rails/ujs'
import Turbolinks from 'turbolinks'
import Notifications from '../common/notifications'

UJS.start()
Turbolinks.start()

document.addEventListener('turbolinks:load', () => {
  Notifications.start()
})
