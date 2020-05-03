class Customer < ApplicationRecord
  validates :first_name, presence: true, length: {minimum: 3, maximum: 10}
  validates :last_name, presence: true, length: {minimum: 3, maximum: 10}
  validates :password, presence: true, length: {minimum: 6, maximum: 16}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
