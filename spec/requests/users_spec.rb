require 'spec_helper'
require 'support/utilities'

describe 'Users' do
  
  subject {page}
  
  describe "Sign_up" do
    before { visit sign_up_path }
    
    it {should have_selector('title', :text=>'Sign up')}
    it {should have_selector('title', :text=>full_title('Cyprus Uni Student Sign up'))}
  end
  
end