class PhotosController < ApplicationController
  
def index
  @gallery=Gallery.find(params[:gallery_id])
  @photos=@gallery.photos.paginate(:page=>params[:page])
end

def new
  @gallery=Gallery.find(params[:gallery_id])
  @photo=@gallery.photos.build
end

def show
end

def create
  @photo=Photo.new(params[:photo])
  if @photo.save
    
    flash[:notice]="The url of the photo just stored is #{@photo.image.url}  "
    # flash[:notice]="The current_path of the photo just stored is #{@photo.image_current_path}  "
    # flash[:notice]="The identifier of the photo just stored is #{@photo.image_identifier}  "
    redirect_to @photo.gallery
  else
    render "new"
  end
end

def destroy
  
  @photo=Photo.find(params[:id])
  @gallery=@photo.gallery
  
  @photo.destroy
  
  flash[:notice]="Photo successfully deleted"
  redirect_to @gallery
  
end
  
  
  
end
