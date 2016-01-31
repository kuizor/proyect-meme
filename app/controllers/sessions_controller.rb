class SessionsController < ApplicationController
	def login
    	login = User.find_by login: params[:login],password: params[:password]
        if login
            session[:login_id]=login.id
            render json: {message: "Has logeado y tu id es #{login.id}"}
        else
            render json: {message: "Usuario inexistente!"}
    	end
    end
	def logout
	    session[:login_id]=nil
	    render json: {message: "Has cerrado sesión"}
	end
end