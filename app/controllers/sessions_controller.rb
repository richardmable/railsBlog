class SessionsController < ApplicationController
	#logs a user in and sets their session
	def create
		#sets @user to the session params defined in the private session_params
		@user = User.where(session_params)
		#check that that the password matches the username provided
		if @user && @user.password == params[:password]
			session[:user_id] == @user.id
			flash[:notice] = "Login was successful."
			#sets the current user, allows use of @currentUser
			current_user
			#redirects to user's profile page
			redirect_to users_index
		else
			#alert the user if they username and password do not match
			flast[:alert] = "Unable to log in. Please check your username and password."
			#reload the page so they can try again
			redirect_to sessions_index
		end
	end

	#logs user out
	def destroy
		#set the session id to nil
		session[:user_id] == nil
		#alert the user they have been logged out
		flash[:notice] = "You are now logged out."
		#redirect to the landing page
		redirect_to home_path
	end
	
	# only strong params for setting sessions
	private
		def session_params
			params.require(:session).permit(:session_id)
		end
end
