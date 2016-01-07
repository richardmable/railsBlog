class SessionsController < ApplicationController

	# only strong params for setting sessions
	private
		def session_params
			params.require(:session).permit(:session_id)
		end
	end

	#logs a user in and sets their session
	def create
		@user = User.where(sessions_params)
		if @user && @user.password == params[:password]
			session[:user_id] == @user.id
			flash[:notice] = "Login was successful."
			#redirects to user's profile page
			redirect_to users_index
		else
			flast[:alert] = "Unable to log in. Please check your username and password."
			redirect_to sessions_index
	end

	#logs user out
	def destroy
		session[:user_id] == nil
		flash[:notice] = "You are now logged out."
		redirect_to home_path
	end

end
