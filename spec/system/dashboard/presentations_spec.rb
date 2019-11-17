# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Presentations Dashboard', type: :system do
  scenario 'user can list all presentations he created' do
    user = Fabricate(:user, email: 'foo@email.com', password: '123456789') do
      presentations(count: 2)
    end

    login_as user
    visit dashboard_presentations_path

    presentation_names = page.all('.card .title').map(&:text)

    expect(presentation_names).to contain_exactly(*(user.presentations.map(&:name)))
  end
end
