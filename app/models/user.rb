# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_authentic

  has_many :presentations, dependent: :delete_all

  validates :email,
    format: {
      with: /@/
    },
    length: { maximum: 100 },
    uniqueness: {
      case_sensitive: false,
      if: :will_save_change_to_email?
    }

  validates :password,
    confirmation: { if: :require_password? },
    length: {
      minimum: 8,
      if: :require_password?
    }

  validates :password_confirmation,
    length: {
      minimum: 8,
      if: :require_password?
    }

  def new_presentation(params = {})
    presentations.build(params)
  end
end
