import 'bulma'
import 'trix'
import '@rails/actiontext'

import UJS from '@rails/ujs'
import Turbolinks from 'turbolinks'
import Notifications from '../common/notifications'

UJS.start()
Turbolinks.start()

document.addEventListener('turbolinks:load', () => {
  Notifications.start()
})
