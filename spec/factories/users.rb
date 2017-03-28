include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    avatar { fixture_file_upload(Rails.root.join('spec/fixtures/avatar.jpg'), 'image/jpg') }
    # avatar_file_name { 'avatar.jpg' }
    # avatar_content_type { 'image/jpg' }
    # avatar_file_size { 1024 }
  end
end
