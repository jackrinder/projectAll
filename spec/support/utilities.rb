
module ApplicationHelper
  # It checks the title method as well
  def full_title(page_title)
    base_title="Combining Project page"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  
  
  def sign_in(user)
    visit signin_path
    fill_in "Email", :with=> user.email
    fill_in "Password", :with =>user.password
    click_button "Sign in"
    #Sign in  when not using Capybara as well
    cookies[:remember_token]=user.remember_token
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

