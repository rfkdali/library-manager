class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  after_create :update_status
  
  private
  
  def update_status
    self.book.borrowed!
  end
end
