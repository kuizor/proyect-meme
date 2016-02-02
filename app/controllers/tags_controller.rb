
class TagsController < ApplicationController
	
	def index
		if (a = params[:id])
			tag = Tag.find(a)
			render json: tag
		else
			tag = Tag.all
			render json:tag
		end
	end

	def show
		tag = Tag.find(params[:id])
		render json: tag
	end

	def create
		tag = Tag.new(permit_params)
		if tag.save
			redirect_to tag
		else
			render json:{message: "No cool", errors: tag.errors.full_message}
		end
	end
	private 
	def permit_params
		params.require(:tag).permit(:name)
	end

	def r_not_found(error)
		render json: {error: error.message}, status: :not_found
	end
end