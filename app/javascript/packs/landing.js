import 'bulma'
import Turbolinks from 'turbolinks'
import Notifications from '../common/notifications'

Turbolinks.start()

document.addEventListener('turbolinks:load', () => {
  Notifications.start()
})
