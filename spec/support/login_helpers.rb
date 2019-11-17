# frozen_string_literal: true

module LoginHelpers
  def login_as(user)
    visit '/login'

    within 'form#user-session' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Login'
    end
  end
end

RSpec.configure do |config|
  config.include LoginHelpers, type: :system
end
