

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person_ar#{n}" }
    sequence(:email) { |n| "person_ar_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
    
  end
  
  factory :invalid_user do
    name ""
    email ""
    password ""
    password_confirmation ""
    
  end
  
  
  
end