# frozen_string_literal: true

class Slide < ApplicationRecord
  belongs_to :presentation

  acts_as_list scope: :presentation
end
