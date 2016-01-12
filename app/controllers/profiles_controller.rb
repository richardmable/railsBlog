class ProfilesController < ApplicationController
  def index
  end

  def new
  	current_user
    @profile = Profile.new
  end


  def create
  	#set the current user
  	current_user	
  	#create the new profile with the provided user input from the form
  	@profile = Profile.create(profile_params)
  	#update the profile's user_id to the current user's id
  	@profile.user_id = @currentUser.id
  	#would like to have a way to check if they've already created a profile
  	# if @profile.exists?(@currentUser.id)
  	#   flash[:alert] = "You've already created a profile! Try the update profile page."
   #    redirect_to profiles_url
  	if @profile.save
      flash[:notice] = "Your profile was created successfully."
      redirect_to profiles_url
     else
      flash[:alert] = "There was a problem creating your profile."
      redirect_to new_profiles_url
     end
  end

  #method for updating the profile of a user
  def update
    current_user
    @profileUpdate = User.find(@currentUser.id).profile.update(profile_params)
    #update the profile's user_id to the current user's id
    # @profileUpdate.user_id = @currentUser.id
    if @profileUpdate
      flash[:notice] = "Your profile was updated successfully."
      redirect_to profile_path
     else
      flash[:alert] = "There was a problem updating your profile."
      redirect_to profile_path
    end
  end

  #method for showing the current user's profile
  def show
    current_user
    @profile = Profile.where(user_id: @currentUser.id)
    @profileUpdate = Profile.where(user_id: @currentUser.id).first
  end

  private

  def profile_params
  	params.require(:profile).permit(:user_id, :fname, :lname, :location, :age)
  end

end
