# frozen_string_literal: true

module NotificationsHelper
  # Wraps a flash in a `Notification` object which handles mapping flash keys to
  # the correct CSS class.
  Notification = Struct.new(:key, :message) do
    FLASH_TO_CSS_MAP = {
      alert: 'is-warning',
      error: 'is-danger',
      notice: 'is-info',
      success: 'is-success'
    }

    def css_class
      FLASH_TO_CSS_MAP[key.to_sym]
    end
  end

  def notifications
    flash.map { |key, value| Notification.new key, value }
  end
end
