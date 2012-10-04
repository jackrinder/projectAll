namespace :db do
  desc "Fill database with sample data"
  task :populate=>:environment do
    # CREATE  admin
    admin=User.create!(:name=>"Ilias Troullinos", :email=>"thlias2000@gmail.com", :password=>"ilis2558",
                        :password_confirmation=>"ilis2558")
    admin.toggle!(:admin)
    # CREATE example user
    User.create!(:name=>"Example User", :email=>"example@railstutorial.org", :password=>"foobar", 
                  :password_confirmation=>"foobar")
    # => CREATE many fake users
    99.times do |n|
      name= Faker::Name.name
      email="example-#{n+1}@railstutorial.org"
      password="password"
      User.create!(:name=> name, :email=>email, :password=>password, :password_confirmation=>password)
    end
    # => CREATE content for the first 6 users
    users=User.all(:limit=>6)
    50.times do
      content=Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(:content=>content)}
    end
  # => CREATE galleries with flickholder tags contained in their names
  # 
    include ApplicationHelper
    
    10.times do |m|
      gallery=Gallery.create!(:name=>gallery_name(m))
      30.times do |n|
        photo_name= Faker::Name.name
        gallery.photos.create!(:name=>photo_name, :remote_image_url=>flickr_remote_url(m,n))
      end
    end
  
  end
  
end