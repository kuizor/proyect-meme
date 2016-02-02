
class CategoriesController < ApplicationController
	
	def index
		if (a = params[:id])
			c = Category.find(a)
			render json: c
		else
			c = Category.all
			render json:c
		end
	end

	def show
		c = Category.find(params[:id])
		render json: c
	end

	def create
		c = Category.new(permit_params)
		if c.save
			redirect_to c
		else
			render json:{message: "No cool", errors: c.errors.full_message}
		end
	end
	def update
		c = Category.find(params[:id])
		if c.update(permit_params)
			render json:{message: "Its cool"}
		else
			render json:{message: "No cool"}
		end
	end
	def destroy
		c = Category.find(params[:id])
		if c.destroy
			render json:{message: "Delete Category"}
		else
			render json:{message: "no Cool"}
		end
	end
	private 
	def permit_params
		params.require(:category).permit(:name)
	end

	def r_not_found(error)
		render json: {error: error.message}, status: :not_found
	end
end