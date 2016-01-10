class SessionsController < ApplicationController
  def create
  	 @user = User.where(username: params[:username]).first      
       if @user && @user.password == params[:password]                 
           session[:user_id] = @user.id        
           redirect_to @user
       else
           flash[:danger] = 'Invalid email/password combination'
           redirect_to root_path
        end 
  end

  def new
  	# @session = Session.new
  end

  def destroy
  	
  end
end
