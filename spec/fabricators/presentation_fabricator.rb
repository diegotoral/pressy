# frozen_string_literal: true

def load_blob_file(file, content_type: Mime[:pdf], metadata: nil)
  root = RSpec.configuration.file_fixture_path
  path = Pathname.new(File.join(root, file.to_s))

  if path.exist?
    ActiveStorage::Blob.create_after_upload!(
      io: path.open,
      filename: file.to_s,
      content_type: Mime[:pdf],
      metadata: metadata
    )
  else
    raise ArgumentError, "could not load file #{file}"
  end
end

Fabricator :presentation do
  user

  name { 'Some name' }

  before_save do |presentation|
    source_file = load_blob_file('presentation1.pdf')
    presentation.source_file.attach(source_file)
  end
end
