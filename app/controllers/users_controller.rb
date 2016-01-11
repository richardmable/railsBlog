class UsersController < ApplicationController

  def index
    #checks to see if there is a user logged in
    current_user
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def show
    current_user 
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your account was created succesfully!"
      session[:user_id] == @user.id
      current_user
      redirect_to user_path @user
    else
      flash[:alert] = "Your account was not created."
      redirect_to new_user_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:password, :username, :email)
    end

end
