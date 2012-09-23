class PagesController < ApplicationController
  
  def home
    @title="Home"
    #Both corrected with 'if signed_in?' because if unsigned there are no micropost
    #or feed_items which means no method error for feed and micropost
    @micropost=current_user.microposts.build if signed_in?
    @feed_items=current_user.feed.paginate(:page=> params[:page]) if signed_in?
  end
  
  def profile
    @title="Profile"
    
  end
  
  def cyprus_uni
    @title="Cyprus-Uni"
    
  end
  
  def one_db_project
    @title="One-DB project"
  end
  
  def photo_gallery
    @title="Photo-Gallery"
  end
  
  def notepad
    @title="Notepad"
  end
  
  def about_us
    @title="About Us"
  end
  
  def contact_us
    @title="Contact Us"
  end
  
  def demo
    @title="Asshole"
  end
  
end
