# frozen_string_literal: true

class Presentation < ApplicationRecord
  belongs_to :user

  has_many :slides, -> { order(position: :asc) }, dependent: :destroy

  has_rich_text :description

  has_one_attached :source_file

  validates :name, presence: true
  validates :source_file, attached: true, content_type: :pdf
end
