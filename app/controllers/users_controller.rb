class UsersController < ApplicationController
  #by default filters apply to every actions in a controller
  #if we use :only=> we restrict filter only to the mentioned actions
  before_filter :signed_in_user ,:only=>[:edit, :update, :index, :destroy]
  #ensures that the correct user is allowed to edit/update the correct settings
  before_filter :correct_user, :only=>[:edit, :update]
  before_filter :admin_user, :only=>:destroy
  
  def index
    #paginate pulls the users out of the db one chunck at a time
    #(30 by default). If :page is nil, it returns the first page.
    @users=User.paginate(:page=>params[:page])
  end
  
  
  def new
   @user=User.new 
  end
  
  def create
    @user=User.new(params[:user])
    if @user.save
      flash[:success]="Welcome to the Sample App, you are ready to sign in now!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  
  def show
    #use params because these are controller actions issued by an URI like /users/:id 
    #at another part of the program
    @user=User.find(params[:id])
    # What's important to note down that there is no controlle for microposts
    @microposts=@user.microposts.paginate(:page=>params[:page])
  end
  
  def edit
    #use params because these are controller actions issued by an URI like /users/:id/edit 
    #at another part of the program
    # we commented the following code because it is already executed in before_filter
    #@user=User.find(params[:id])
  end
  
  def update
    #use params because these are controller actions issued by an URI like /users/:id, method=PUT 
    #at another part of the program
    # we commented the following code because it is already executed in before_filter
    # @user=User.find(params[:id])
    #we read the attributes from edited in the form
    if @user.update_attributes(params[:user])
      #handle a successful edit
      flash[:success]="User settings successfully updated"
      sign_in @user
      redirect_to root_path
    else
      #handle an unsuccessful edit 
      flash[:notice]="Please re-fill the form"
      #To show the errors we must render the edit form again
      #if we use redirect_to to go to edit controller again
      #the instance variable @user and the @user.errors will be lost
      render "edit"
    end  
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success]="User destroyed"
    redirect_to users_path
  end
  
  private
    
    
    def correct_user
      @user=User.find(params[:id])
      redirect_to root_path, :notice=>"You are not privileged to proceed to this action" unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin? 
    end
  
  
end
