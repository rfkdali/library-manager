require 'rails_helper'

RSpec.describe User, :type => :model do
  
  describe "Attributes" do
    before do
      FactoryGirl.create(:user, email: "test@test.com")
    end

    it "is valid with valid attributes" do
      user = FactoryGirl.build(:user, email: "test2@test.com")
      expect(user).to be_valid
    end

    it "is not valid without email" do
      user = FactoryGirl.build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "is not valid with an existing email" do
      user = FactoryGirl.build(:user, email: "test@test.com")
      expect(user).to_not be_valid
    end
    it "is not valid without first_name" do
      user = FactoryGirl.build(:user, first_name: nil)
      expect(user).to_not be_valid
    end
    it "is not valid without last_name" do
      user = FactoryGirl.build(:user, last_name: nil)
      expect(user).to_not be_valid
    end

    it "has attached file" do
      user = FactoryGirl.create(:user)
      expect(user).to have_attached_file(:avatar)
    end
  end

  describe "Instance methods" do
    it "returns full_name" do
      user = FactoryGirl.create(:user, first_name: "John", last_name: "Rambo")
      expect(user.full_name).to eq("John Rambo")
    end
  end 
end


