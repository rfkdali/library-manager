require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe "Loan creation" do
    let!(:loan) { FactoryGirl.build(:loan) }

    it "updates book status" do
      @loan = loan.save
      expect(loan.book.borrowed?).to be_truthy
    end
  end
end