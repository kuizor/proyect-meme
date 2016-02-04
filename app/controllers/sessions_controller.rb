require 'securerandom'
class SessionsController < ApplicationController
	before_action :authenticate, except: [:create]
	skip_before_action :require_login, only: [:create]
	def create
		user = User.find_by login: params[:login],password: params[:password]
		if user
			if (user.token==nil)
				user.token = SecureRandom.uuid.gsub("/[aeiou]/","*")
				user.save
				render json: {message: "Bienvenido #{user.login}, Token ID: #{user.token}"}
			else
				render json:{message: "User Logged"}
			end
		else
			render json: {message: "Invalid user/password"}
		end
	end
	def destroy
		if @user.token==nil
			render json:{message: "Debe Loguearse"}
		else
	    	@user.token=nil
	    	@user.save
	    	render json: {message: "LogOut"}
	    end
 	end
end