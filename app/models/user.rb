class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :user_types
  has_many :photos

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
