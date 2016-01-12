class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # method to set the user's session in actions
  def current_user
  	if session[:user_id]
  	@currentUser = User.find(session[:user_id])
  	end
  end

  def no_current_user
    if not current_user
      flash[:alert] = "You need to be logged in to access the site."
    redirect_to login_url
    end
  end
#this runs current_user on every action every time it is called
  # before_action :current_user
 end
