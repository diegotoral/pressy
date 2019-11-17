# frozen_string_literal: true

Fabricator :user do
  password_confirmation { |attrs| attrs[:password] }
end
