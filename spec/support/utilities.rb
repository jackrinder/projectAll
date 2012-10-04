# Is necessary so that RSpec::Matchers works
include ApplicationHelper



module GeneralTools
  # It checks the title method as well
  def full_title(page_title)
    base_title="Combining Project page"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  

end 


module BasicPageTests
  # # It checks if title and h1 selectors contain
  #  # the necessary content
  #  def check_selector(*hashes={} )
  #    for hash_selector in hashes
    
  #    #    it {should have_selector(, :text=>text_content)}
  #    
  #  end
  
  
  
end

module SignUpTools
  
  def valid_sign_in(user)
    visit signin_path
    fill_in "Email", :with=> user.email
    fill_in "Password", :with =>user.password
    click_button "Sign in"
    #Sign in  when not using Capybara as well
    cookies[:remember_token]=user.remember_token
  end
  
  def fill_in_valid_info
    fill_in "Name",       :with=>"Example User"
    fill_in "Email",       :with=>"user@example.com"
    fill_in "Password",       :with=>"foobar"
    fill_in "Password confirmation",   :with=>"foobar"
  end
  
  def should_create_user
    expect { click_button submit }.to change(User, :count) .by(1)
  end
  
  RSpec::Matchers.define :see_error_message do |message|
    match do |page|
      page.should have_selector('div.alert.alert-error', :text=>message)
    end
  end
  
end

module IndexPageTools
  
  def create_many(user)
    30.times {FactoryGirl.create(:user)}
  end
  
  RSpec::Matchers.define :check_pagination do 
    match do |page|
      page.should have_selector('div.pagination')
    end
  end
  
  
  
end


