class Upload < ApplicationRecord
  belongs_to :user

  validates :filename, presence: true
end
