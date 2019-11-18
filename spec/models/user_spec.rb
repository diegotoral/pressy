# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { Fabricate.build(:user) }

  describe '#new_presentation' do
    it 'works without specifing params' do
      expect { user.new_presentation }.not_to raise_error
    end

    it 'assigns presentation to the user' do
      params = {}

      presentation = user.new_presentation params

      expect(presentation.user).to eq user
    end
  end
end
