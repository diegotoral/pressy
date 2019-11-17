# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Presentations Dashboard', type: :system do
  let(:user) do
    Fabricate(:user, email: 'foo@email.com', password: '123456789') do
      presentations(count: 2)
    end
  end

  scenario 'user can list all presentations he created' do
    login_as user
    visit dashboard_presentations_path

    presentation_names = page.all('.card .title').map(&:text)

    expect(presentation_names).to contain_exactly(*(user.presentations.map(&:name)))
  end

  scenario 'user can delete a presentation' do
    presentation = user.presentations.first

    login_as user
    visit dashboard_presentations_path

    within "#presentation-#{presentation.id}" do
      find('.dropdown-trigger').hover
      accept_alert do
        click_on t('dashboard.presentations.presentation.remove')
      end
    end

    expect(page).to have_content t('dashboard.presentations.destroy.success')
  end
end
