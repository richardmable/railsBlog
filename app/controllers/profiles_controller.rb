class ProfilesController < ApplicationController
  def index
  end

  def new
  end


  def create
  	current_user
  	:profile[user_id] = @currentUser.id
  	@profile = Profile.create(profile_params)
  	if @profile.save
      flash[:notice] = "Your profile was created successfully."
      redirect_to profiles_url
     else
      flash[:alert] = "There was a problem creating your profile."
      redirect_to profiles_new_url
     end
  end

  def show
  end

  private

  def profile_params
  	params.require(:profile).permit(:user_id, :fname, :lname, :location, :age)
  end

end
