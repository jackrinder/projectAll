require 'spec_helper'
require 'support/utilities'



describe "Pages" do

  subject {page}

  # Uses shared_examples as a template for all pages
  shared_examples_for "all pages" do
    it { should have_selector('h1', :text=>heading) }
    it { should have_selector('title', :text=> full_title(page_title))}
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About Us"
    page.should have_selector('title', :text=>"About Us")
  end


  describe "Home" do
    before { visit root_path}
    # substitutes :heading and :page_title with the corresponding value for each page
    let(:heading) {'Home'}
    let(:page_title) {'Home'}

    it_should_behave_like 'all pages'
    #We can then build examples which go only to specific pages
    it { should_not have_selector('title', :text=> full_title('|Home'))}
  
    
    describe "for signed-in users" do
      let(:user) {FactoryGirl.create(:user)}
      before do
        FactoryGirl.create(:micropost, :user=>user, :content=> "Lorem ipsum")
        FactoryGirl.create(:micropost, :user=>user, :content=> "Dolor sit amet")
        sign_in user
        visit root_path
      end
      
      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", :text=> item.content)
        end
      end
    end
  end

    


  describe "Profile" do
    before {visit profile_path}
    let(:heading) {'Profile'}
    let(:page_title) {'Profile'}

    it_should_behave_like 'all pages'
  end


  describe "Cyprus-Uni" do
    before { visit cyprus_uni_path }   
    let(:heading) {'Cyprus-Uni'}
    let(:page_title) {'Cyprus-Uni'}

    it_should_behave_like 'all pages'
  end

  describe "One-DB project" do
    before{ visit one_db_project_path } 
    let(:heading) {'One-DB project'}
    let(:page_title) {'One-DB project'}

    it_should_behave_like 'all pages'
  end

  describe "Photo-Gallery" do
    before { visit photo_gallery_path }
    let(:heading) {'Photo-Gallery'}
    let(:page_title) {'Photo-Gallery'}

    it_should_behave_like 'all pages'
  end

  describe "Notepad" do
    before { visit notepad_path }
    let(:heading) {'Notepad'}
    let(:page_title) {'Notepad'}

    it_should_behave_like 'all pages'
  end

  describe "About Us" do
    before {visit about_us_path}
    let(:heading) {'About Us'}
    let(:page_title) {'About Us'}

    it_should_behave_like 'all pages'
  end


  describe "Contact Us" do
    before {visit contact_us_path}
    let(:heading) {'Contact Us'}
    let(:page_title) {'Contact Us'}

    it_should_behave_like 'all pages'

  end

  describe "Demo" do
    before {visit demo_path}
    let(:heading) {'Demo'}
    let(:page_title) {'Demo'}

    it_should_behave_like 'all pages'
  end



end
