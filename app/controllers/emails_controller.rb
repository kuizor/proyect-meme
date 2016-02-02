class EmailsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :r_not_found
	#rescue_from ActionController::ParameterMissing, with: :params_message 
	include ServiceEmail
	def index
		e = Email.all
		render json:e
	end

	def create
		puts "Parametros-->#{params}"
		
		e = Email.new(permit_params)
		if e.save
			send_message(params[:email_name],params[:link])
			render json:{message: "EmailSend"}
		else
			render json:{message: "Error", errors: e.errors.full_message}
		end
	end
	private 
	def permit_params
		params.require(:email).permit(:email_name, :link)
	end

	def params_message(error)
		render json: {error: error.message}, status: :bad_request
	end

	def r_not_found(error)
		render json: {error: error.message}, status: :not_found
	end
end