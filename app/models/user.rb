class User < ApplicationRecord
  before_create :create_token

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true

  has_many :books, dependent: :destroy
end
