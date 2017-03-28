require 'rails_helper'

RSpec.describe Book, :type => :model do
  
  describe "Attributes" do
    before do
      FactoryGirl.create(:book, title: "Title test")
    end

    it "is valid with valid attributes" do
      user = FactoryGirl.build(:book, title: "Title test 2")
      expect(user).to be_valid
    end

    it "is not valid without title" do
      user = FactoryGirl.build(:book, title: nil)
      expect(user).to_not be_valid
    end

    it "is not valid with an existing title" do
      user = FactoryGirl.build(:book, title: "Title test")
      expect(user).to_not be_valid
    end

    it "is not valid without author" do
      user = FactoryGirl.build(:book, author: nil)
      expect(user).to_not be_valid
    end
  end
end


