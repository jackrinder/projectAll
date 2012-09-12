require 'spec_helper'
require 'support/utilities'




describe "Pages" do
 
  subject {page}
  
  describe "Home" do
    before { visit root_path}
      # before(:each) είναι συνώνυμο
      
        it { should have_selector('h1', :text=>'Home') }
        it { should have_selector('title', :text=> full_title('Home'))}
    end
    
    

    describe "Profile" do
      before {visit profile_path}
      
      it {should have_selector('h1', :text=>'Profile') }
    end
 
 
    describe "Cyprus-Uni" do
      before { visit cyprus_uni_path }   
          
      it {should have_selector('h1', :text=>'Cyprus-Uni') }
    end
 
    describe "One-DB project" do
      before{ visit one_db_project_path } 
             
      it { should have_selector('h1', :text=>'One-DB project') }
    end
 
    describe "Photo-Gallery" do
      before { visit photo_gallery_path }
      
      it { should have_selector('h1', :text=>'Photo-Gallery') }
    end
 
    describe "Notepad" do
      before { visit notepad_path }
      
      it { should have_selector('h1', :text=>'Notepad') }
    end
  
    describe "About Us" do
      before {visit about_us_path}
      
      it {should have_selector('h1', :text=>'About Us')}
    end
 
  
    describe "Contact Us" do
        before {visit contact_us_path}
        
        it {should have_selector('h1', :text=>'Contact Us')}
      
    end
   
    describe "Demo" do
      before {visit demo_path}
      
      it {should have_selector('h1', :text=>"Demo")}
    end
    
    
  
 end
 