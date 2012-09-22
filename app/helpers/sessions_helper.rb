module SessionsHelper
  
  # helper methods are readily available to all views 
  
  
  # def show_flash_message(options={})
  #     html = content_tag(:div, flash.collect{ |key,msg| content_tag(:div, msg, :class => key) }, :id => 'flash-message')
  #     if options.key?(:fade)
  #       html << content_tag(:script, "setTimeout(\"new Effect.Fade('flash-message');\",#{options[:fade]*1000})", :type => 'text/javascript')
  #     end
  #     html
  #   end
  
  # def show_flash(options={})
  #     options = {:fade => 3, :display => 3, :highlight => true}.merge(options)
  #     html = content_tag(:div, flash.collect{ |key,msg| content_tag(:div, msg, :class => key, :attributes => "style = display: none;") }, :id => 'flash-message')
  #     html << content_tag(:script, "new Effect.Highlight('flash-message');") if options[:highlight]
  #     html << content_tag(:script, "$('flash-message').appear();")
  #     html << content_tag(:script, "setTimeout(\"$('flash-message').fade({duration: #{options[:fade]}});\", #{options[:display]*1000});")
  #   end
  
  def sign_in(user)
    cookies.permanent[:remember_token]=user.remember_token
    current_user=user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    current_user=nil
    cookies.delete(:remember_token)
  end

# This is a classic setter method 
  def current_user=(user)
    @current_user=user
  end
  
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  
  def current_user?(user)
    user== current_user
  end
  
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  
  def store_location
    session[:return_to]=request.fullpath
  end
  
  
  
  
end
