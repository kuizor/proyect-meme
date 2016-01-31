class UsersController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :r_not_found

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
		params.require(:user).permit(:login, :password, :type)
	end

	def r_not_found(error)
		render json: {error: error.message}, status: :not_found
	end
end