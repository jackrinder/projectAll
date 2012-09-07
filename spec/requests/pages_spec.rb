require 'spec_helper'



describe "Pages" do
 


  describe "Home" do
    it "should have the content 'Home' " do
      visit '/pages/home'
      page.should have_content('Home')
    end
  end

  describe "Profile" do
    it "should have the content 'Profile'" do
      visit '/pages/profile'
      page.should have_content('Profile')
    end
  end

  describe "Cyprus-Uni" do
    it "should have the content 'Cyprus-Uni' " do
      visit '/pages/cyprus_uni'
      page.should have_content('Cyprus-Uni')
    end
  end

  describe "One-DB project" do
    it "should have the content 'One-DB project' " do
      visit '/pages/one_db_project'
      page.should have_content('One-DB project')
    end
  end

  describe "Photo-Gallery" do
    it "should have the content 'Photo-Gallery' " do
      visit '/pages/photo_gallery'
      page.should have_content('Photo-Gallery')
    end
  end

  describe "Notepad" do
    it "should have the content 'Notepad'" do
      visit '/pages/notepad'
      page.should have_content('Notepad')
    end
  end

  describe "About Us" do
    it "should have the content 'About Us" do
      visit '/pages/about_us'
      page.should have_content('About Us')
    end
  end


  describe "Contact Us" do
    it "should have the content 'Contact Us" do
      visit '/pages/contact_us'
      page.should have_content('Contact Us')
    end
  end
  
  describe "Demo" do
    it "should have the content 'Demo' " do
    visit '/pages/demo'
    page.should have_content("Demo")
    end
  end
  

end
