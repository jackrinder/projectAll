class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    # user=User.find_by_email(params[:session][:email])
    user=User.find_by_email(params[:email])
    # if user && user.authenticate(params[:session][:password])
    if user && user.authenticate(params[:password])
      flash[:success]="Welcome back #{user.name}"
      
      sign_in(user)
      redirect_back_or root_path
    else
      # create an error message and re-render the sign in form
      flash.now[:error]="Invalid email/password confirmation"
      # The issue is that the contents of the flash persists for one
      # request but unlike a redirect, re-rendering a template with render does
      # not count as a request. The result is that the flash message persists
      # longer than we want.
      #The problem is solved with .now !!!
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
end


