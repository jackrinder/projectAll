

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
  # this allows us to define factory microposts as follows:
  # FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
  #notice that in FactoryGirl we can assign variables like created_at 
  #which are not accessible in Active model. REALLY HELPFULL
  
  
  
end