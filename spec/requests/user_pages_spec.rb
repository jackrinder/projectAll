require 'spec_helper'

include GeneralTools
include SignUpTools
include IndexPageTools


# ======================================================
# = PAGES WHERE USERS OR THEIR INTERACTION IS EXAMINED =
# ======================================================
describe "User pages" do
  

  subject { page }
  
  
# ================
# = 0)USER PROFILE PAGE =
# ================

  describe "profile page" do
    let(:user) {FactoryGirl.create(:user) }
    let!(:m1) {FactoryGirl.create(:micropost, :user=>user, :content=>"Foo") }
    let!(:m2) {FactoryGirl.create(:micropost, :user=>user, :content=>"Bar") }
  
    before { visit user_path(user) }
    it {should have_selector("h1", :text=>user.name)}
    it {should have_selector("title", :text=>user.name)}
    # USER PROFILE PAGE
    # VISITS USER PROFILE PAGE
    # WRITES TWO MICROPOSTS WITH DIFFERENT CONTENT
    # SHOULD SEE TWO MICROPOSTS
    # WITH THE CORRECT CONTENT
    # 
    describe "microposts" do
      it {should have_content(m1.content)}
      it {should have_content(m2.content)}
      it {should have_content(user.microposts.count)}
    end      
    
  
  end


# ====================
# = 1)USERS INDEX PAGE =
# ====================
  describe "index" do
    
      let(:user) {FactoryGirl.create(:user)}
      before(:all) {create_many(:user)}
      after(:all) {User.delete_all}
      
      before(:each) do
        valid_sign_in user
        visit users_path
      end
    
      it {should have_selector("title", :text=>"All users")}
      it {should have_selector("h1", :text=>"All users")}
    # USER INDEX PAGE
    # 1.1)CHECKS IF ALL USERNAMES ARE DISPLAYED PROPERLY IN THE FIRST PAGE
      describe "pagination" do
        it {check_pagination}
        
        
        it "should list each user" do
          User.paginate(:page=>1).each do |user|
            page.should have_selector('li', :text=>user.name)
          end
        end
      end
      
      # USER INDEX PAGE
      # 
      # 1.2)CHECKS THAT THERE IS NO DELETE LINK IN EACH USER'S IN USERS INDEX 
      #   EXCEPT ADMIN USER WHO HAS DELETE LINK ON EVERYONE OTHER THAN HIMSELF
      describe "delete links" do
        it { should_not have_link("delete") }
        
        describe "as an admin user" do
          let(:admin) { FactoryGirl.create(:admin) }
          before do
            sign_in admin
            visit users_path
          end
          
          it {should have_link("delete", :href=>user_path(User.first) ) }
          it "should be able to delete another user" do
            expect { click_link("delete").to change(User, :count).by(-1)  }
          end
          it {should_not have_link("delete", :href=>user_path(admin))}
        end
        
      end
      
  end

# ====================
# = 2)USER SIGNUP PAGE =
# ====================
  describe "signup page" do
    before { visit sign_up_path }

    it { should have_selector('h1', :text=>"Sign up")}
    it { should have_selector('title', :text=>"Sign up")}

    let(:submit) { "Create my account" }

    #  USER SIGNUP PAGE
    #  2.1) CHECKS CREATE ACTION
    #       IT SHOULD NOT CREATE A USER WITH INVALID ATTRIBUTES
    describe "with invalid information" do

      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    
    
    
    #  USER SIGNUP PAGE
    #  2.2)CHECKS IF AFTER INVALID SUBMISSION
    #       THE USER IS SHOWN AN ERROR
    #       AND IS STILL IN SIGNUP PAGE
    describe "with invalid information" do 
      let(:invalid_user) {FactoryGirl.create(:invalid_user)}
      
      describe "after submission" do 
        before {click_button submit}
        it {should have_selector("title", :text=>"Sign up")}
        it {should see_error_message("error")}
        # it {should have_content("error")}
      end
    end

      #  USER SIGNUP PAGE
      #  2.2) CHECKS CREATE ACTION
      #  IT SHOULD CREATE A USER WITH VALID ATTRIBUTES
    describe "with valid information" do
      before do
        fill_in_valid_info
      end

      it "should create a user" do
        should_create_user
      end
      
      
    end
    
    
    
      
      
      
  end
  
  
# ============================
# = 3)USER UPDATE PROFILE PAGE =
# ============================  
  describe "Edit " do
    let(:user) {FactoryGirl.create(:user)}
    
    before do 
      #must sign in user first because there is a filter in edit and update 
      #allowing only signed in users.
      sign_in user
      visit edit_user_path(user)
    end
    
    #  USER UPDATE PROFILE PAGE
    #  3.1) WHO HAS SIGNED 
    #       AND HAS VISITED UPDATE PROFILE PAGE
    # =>    SHOULD SEE A LINK NAMED CHANGE WHICH REDIRECTS TO GRAVATAR PAGE
      describe "page" do
        it { should have_selector("h1", :text=>"Update your profile")}
        it { should have_selector("title", :text=>"Edit user")}
        it { should have_link("change", :href=>"http://gravatar.com/emails")}
      end
    
      #   USER UPDATE PROFILE PAGE
      #   3.2) IS SIGNED IN AND VISITED UPDATE PROFILE PAGE
      # => AND SUBMITS INVALID INFORMATION
      #     SHOULD SEE AN ERROR
      describe "with invalid information" do
        before {click_button "Save changes"}
        
        it {should have_content('error')}
      end
      
      
      #   USER UPDATE PROFILE PAGE
      #   3.3) IS SIGNED IN AND VISITED UPDATE PROFILE PAGE
      #   AND SUBMITS VALID INFORMATION
      #   SHOULD SEE AN SUCCESS NOTICE
      # => AND HIS INFOS MUST BE CHANGED TO THE NEW ONES
      describe "with valid information" do
        let(:new_name) {"New Name"}
        let(:new_email) {"new@example.com"}
        
        before do
          fill_in "Name", :with=> new_name
          fill_in "Email", :with=> new_email
          fill_in "Password", :with=> user.password
          fill_in "Password confirmation", :with=>user.password
          click_button "Save changes"
        end
        
        it {should have_selector("title", :text=>"Home")}
        it {should have_selector("div.alert.alert-success")}
        it {should have_link("Sign out", :href=>signout_path)}
        #reload is needed to read the saved attribues from db
        specify { user.reload.name.should == new_name}
        specify { user.reload.email.should == new_email}
      end
    end
    
    
    
    
    
  
end