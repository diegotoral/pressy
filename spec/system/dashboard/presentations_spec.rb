# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Presentations Dashboard', type: :system do
  let(:user) { Fabricate(:user, email: 'foo@email.com', password: '123456789') }
  let(:presentations) { Fabricate.times(2, :presentation, user: user) }

  scenario 'user can list all presentations he created' do
    login_as user
    visit dashboard_presentations_path

    presentation_names = page.all('.card .title').map(&:text)

    expect(presentation_names).to contain_exactly(*(user.presentations.map(&:name)))
  end

  scenario 'user can delete a presentation' do
    presentation = presentations.first

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

  scenario 'user can create a presentation' do
    presentation_params = Hash[name: 'Monkeys', description: '<i>it works</i>']

    login_as user
    visit dashboard_presentations_path

    click_on t('dashboard.presentations.index.new')

    within 'form#presentation' do
      fill_in 'Name', with: presentation_params[:name]
      fill_in_rich_text_area with: presentation_params[:description]
      attach_file 'presentation_source_file', file_fixture('presentation1.pdf')

      click_on t('dashboard.presentations.new.save')
    end

    expect(page).to have_content t('dashboard.presentations.create.success')
  end

  scenario 'user can not create a presentation with invalid attributes' do
    login_as user
    visit dashboard_presentations_path

    click_on t('dashboard.presentations.index.new')

    within 'form#presentation' do
      fill_in 'Name', with: 'Only name'

      click_on t('dashboard.presentations.new.save')
    end

    expect(page).to have_content t('dashboard.presentations.create.error')
  end

  scenario 'user can edit name and description of any presentation' do
    presentation = presentations.first

    login_as user
    visit dashboard_presentations_path

    within "#presentation-#{presentation.id}" do
      find('.dropdown-trigger').hover
      click_on t('dashboard.presentations.presentation.edit')
    end

    find('#presentation-options').click

    within 'form#presentation-form' do
      fill_in 'Name', with: 'New name'
      click_on 'Update Presentation'
    end

    expect(page).to have_content 'New name'
  end
end
