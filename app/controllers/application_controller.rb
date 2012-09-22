class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  # helpers methods in helper modules are not available to controllers, only
  # to views. If we want to use a method in the controller we have to use
  # include SessionsHelper here for instance
  # The reason to include here and not directly to the controller is that 
  # there is a rule of thumb that we must keep controllers as clean as possible
  include SessionsHelper
  
  #we can use include here because all controllers inherit from ApplicationController
  # So there will have all the methods from ActionController::Base and the methods defined
  # here as well. 
  
  #We are going to use protected so that only controllers inheriting from this class can use them
  
  
    
  



  
end
