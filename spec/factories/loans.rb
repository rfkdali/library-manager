FactoryGirl.define do
  factory :loan do
    user_id { FactoryGirl.create(:user).id }
    book_id { FactoryGirl.create(:book).id }
  end
end
