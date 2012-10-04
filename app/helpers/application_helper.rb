module ApplicationHelper
  
  def title 
    base_title='Combining Project Page'
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def gallery_name(n)
    "gallery_#{flickr_tag(n)}"
  end
  
  def flickr_tag(n)
   tags=%w[ sea sun portrait animal mountain sexy pretty beauty horse dog]
   tags[n]
  end
  
  def flickr_remote_url(m,n)
    photo_dimensions=["200/300/", "300/200/"]
    photo_base="http://flickholdr.com/"
    photo_base+photo_dimensions[rand(photo_dimensions.length)]+flickr_tag(m)+"/#{n}"
  end
  
end
