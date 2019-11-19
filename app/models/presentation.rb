# frozen_string_literal: true

class Presentation < ApplicationRecord
  belongs_to :user

  has_many :slides, -> { order(position: :asc) }, dependent: :destroy

  has_rich_text :description

  has_one_attached :source_file

  validates :name, presence: true
  validates :source_file, attached: true, content_type: :pdf

  # TODO: https://github.com/diegotoral/pressy/issues/31
  def cover
   slides.first.try(:background_image)
  end

  def add_slide_from_io(io, filename, position)
    slide = slides.create!(position: position)
    slide.background_image.attach(io: io, filename: filename)
  end
end
