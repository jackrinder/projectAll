class Photo < ActiveRecord::Base
  
  attr_accessible :gallery_id, :image, :name, :remote_image_url
  belongs_to :gallery
  
  mount_uploader  :image, ImageUploader
end
