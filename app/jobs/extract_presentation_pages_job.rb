# frozen_string_literal: true

require 'docsplit'
require 'fileutils'

class ExtractPresentationPagesJob < ApplicationJob
  queue_as :default

  def perform(presentation, *args)
    output_dir = tmpdir_for(presentation)
    images_output_dir = output_dir.join('images')

    # Ensure we start on a clean filesystem state.
    FileUtils.rm_rf output_dir
    FileUtils.mkdir_p output_dir

    presentation.source_file.open(tmpdir: output_dir) do |file|
      Docsplit.extract_images file.path, output: images_output_dir
    end

    images = images_output_dir.glob('*.png').sort!

    images.each_with_index do |image, index|
      filename = File.basename(image)
      presentation.add_slide_from_io(image.open, filename, index + 1)
    end
  rescue ActiveStorage::IntegrityError
    Rails.logger.error "Failed to process file"
  end

  private

  def tmpdir_for(resource)
    Rails.root.join('tmp', 'presentation_pages', "presentation-#{resource.id}")
  end
end
