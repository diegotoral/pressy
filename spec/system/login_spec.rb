# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :system do
  let!(:user) { Fabricate(:user, email: 'foo@bar.com', password: '1q2w3e4r') }

  scenario 'visitor can login with email and password' do
    visit '/'

    click_link t('landing.navigation.login')

    within 'form#user-session' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Login'
    end

    expect(page).to have_content t('user_sessions.create.success')
  end

  scenario 'visitor gets notified when logging in with wrong credentials' do
    visit '/'

    click_link t('landing.navigation.login')

    within 'form#user-session' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '12345678'
      click_on 'Login'
    end

    expect(page).to have_content t('user_sessions.create.error')
  end
end
