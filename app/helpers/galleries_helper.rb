module GalleriesHelper
  
  def add_menu_item(text,path,*rest)
    content_tag(:li, link_to (text, path,*rest)  )
  end
  
  def add_table_item(text,path,*rest)
    content_tag(:td, link_to(text,path,*rest) )
  end


  
  

  
end


