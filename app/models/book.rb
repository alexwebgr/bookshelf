class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :date_published, presence: true
  validates :unique_identifier, presence: true, uniqueness: true
  validates :publisher_name, presence: true
end
