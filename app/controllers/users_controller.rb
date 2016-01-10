class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

   def create
    puts "*************"
    puts "These are the PARAMS"
    puts params[:user]
    puts "CREATING USER"

      @user = User.create(user_params)
     if @user.save
      flash[:notice] = "Your account was created successfully."
      redirect_to @user
     else
      flash[:alert] = "There was a problem saving your account."
      redirect_to new_user_path
     end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    puts "UPDATING"
    puts params
    @user = User.find(params[:id])
    redirect_to user_path @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
end

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
