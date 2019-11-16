# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Landing Page', type: :system do
  scenario 'visitor finds link to sign up ' do
    visit '/'

    expect(page).to have_link I18n.t('landing.navigation.sign_up')
  end
end
