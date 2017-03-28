class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true

  has_one :loan
  has_one :user, through: :loan

  enum status: [:available, :borrowed]
end
