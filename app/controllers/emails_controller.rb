class EmailsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :r_not_found
	#rescue_from ActionController::ParameterMissing, with: :params_message 

	def index
		e = Email.all
		render json:e
	end

	def create
		e = Email.new(permit_params)
		if e.save
			render json:{message: "Its cool"}
		else
			render json:{message: "No cool", errors: e.errors.full_message}
		end
	end
	private 
	def permit_params
		params.require(:mail).permit(:mail, :link)
	end

	def params_message(error)
		render json: {error: error.message}, status: :bad_request
	end

	def r_not_found(error)
		render json: {error: error.message}, status: :not_found
	end
end