FactoryGirl.define do
  factory :book do
    title { FFaker::Book.title }
    author { FFaker::Book.author }
    resume { FFaker::Lorem.paragraph }
    status 1
  end
end
