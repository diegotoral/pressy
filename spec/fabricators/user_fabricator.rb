# frozen_string_literal: true

Fabricator :user do
  email { FFaker::Internet.unique.email }
  password { '1q2w3e4r' }
  password_confirmation { |attrs| attrs[:password] }
end
