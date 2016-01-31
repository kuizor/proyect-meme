class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	rescue_from ActiveRecord::RecordNotFound, with: :r_not_found
	#rescue_from ActionController::ParameterMissing, with: :params_message 

	def index
		u = User.all
		render json:u
	end

	def show
		u = User.find(params[:id])
		render json: u
	end

	def create
		u = User.new(permit_params)
		if u.save
			render json:{message: "Its cool"}
		else
			render json:{message: "No cool", errors: u.errors.full_message}
		end
	end
	def update
		u = User.find(params[:id])
		if u.update(permit_params)
			render json:{message: "Its cool"}
		else
			render json:{message: "No cool"}
		end
	end
	def destroy
		u = User.find(params[:id])
		if u.destroy
			render json:{message: "Its cool"}
		else
			render json:{message: "no Cool"}
		end
	end
	private 
	def permit_params
		puts "--->",params
		#params.fetch(:user,{}).permit(:login, :password, :type_user)
		params.require(:user).permit(:login,:password, :type_user)
	end

	def params_message(error)
		render json: {error: error.message}, status: :bad_request
	end

	def r_not_found(error)
		render json: {error: error.message}, status: :not_found
	end
end