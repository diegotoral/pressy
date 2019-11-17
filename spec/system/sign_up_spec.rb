# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign Up', type: :system do
  scenario 'visitor sign up successfuly' do
    visit '/'

    click_link t('landing.navigation.sign_up')

    within 'form#user' do
      fill_in 'Email', with: 'some@email.com'
      fill_in 'Password', with: '1q2w3e4r'
      fill_in 'Password confirmation', with: '1q2w3e4r'

      click_on 'Sign Up'
    end

    expect(page).to have_content t('users.create.success')
  end

  scenario 'visitor finds a problem while signing up' do
    visit '/'

    click_link t('landing.navigation.sign_up')

    within 'form#user' do
      fill_in 'Email', with: 'some@email.com'
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '123'

      click_on 'Sign Up'
    end

    expect(page).to have_content t('users.create.error')
  end
end
