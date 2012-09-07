module ApplicationHelper
  
  def title 
    base_title='Combining Project Page'
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
end
