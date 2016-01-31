class SessionsController < ApplicationController
	def create
		user = User.find_by login: params[:login],password: params[:password]
		if user
			session[:user_id] = user.id
			#render json: {message: "LogIn OK!"}
			redirect_to user
		else
			render json: {message: "Invalid user/password"}
		end
	end

	def destroy
    	session[:user_id]=nil
    	render json: {message: "LogOut"}
 	end
end