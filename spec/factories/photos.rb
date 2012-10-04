# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    gallery_id 1
    name "MyString"
    image_file "MyString"
    remote_image_file_url "MyString"
  end
end
