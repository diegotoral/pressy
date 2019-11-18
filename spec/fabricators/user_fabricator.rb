# frozen_string_literal: true

Fabricator :user do
  email { 'test@user.com' }
  password { '1q2w3e4r' }
  password_confirmation { |attrs| attrs[:password] }
end
