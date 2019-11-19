# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Preview Presentation', type: :system do
  let!(:user) { Fabricate(:user) }
  let!(:presentation) { Fabricate(:presentation, user: user) }

  scenario 'user can preview his own presentations' do
    login_as user
    visit dashboard_presentations_path

    within "#presentation-#{presentation.id}" do
      find('.dropdown-trigger').hover
      click_on t('dashboard.presentations.presentation.preview')
    end

    expect(page).to have_content presentation.name
  end
end
