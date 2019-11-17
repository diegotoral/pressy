# frozen_string_literal: true

class Presentation < ApplicationRecord
  belongs_to :user

  has_rich_text :description

  validates :name, presence: true
end
