class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true

  has_one :loan, dependent: :destroy
  has_one :user, through: :loan

  enum status: [:available, :borrowed]

  def available
    .where(status: :available)
  end

  def self.borrowed
    joins(:loan)
  end
end
