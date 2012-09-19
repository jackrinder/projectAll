

FactoryGirl.define do
  factory :user do
    name  "Ilias Troullinos"
    email "thlias2000@gmail.com"
    password "foobar"
    password_confirmation "foobar"
    
  end
  
  factory :invalid_user do
    name ""
    email ""
    password ""
    password_confirmation ""
    
  end
  
end