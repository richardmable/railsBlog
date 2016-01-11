class ProfilesController < ApplicationController
  def index
  end

  def new
  	current_user
  end


  def create
  	#set the current user
  	current_user	
  	#create the new profile with the provided user input from the form
  	@profile = Profile.create(profile_params)
  	#update the profile's user_id to the current user's id
  	@profile.user_id = @currentUser.id
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
