
class MemesController < ApplicationController
	
	def index
		if (a = params[:id])
			c = Meme.find(a)
			render json: c
		else
			meme = Meme.all
			render json:meme
		end
	end

	def show
		meme = Meme.find(params[:id])
		render json: meme
	end

	def create
		meme = Meme.new(permit_params)
		if meme.save
			#render json:{link: "#{meme.link}"}
			redirect_to meme
		else
			render json:{message: "No cool", errors: meme.errors.full_message}
		end
	end
	def destroy
		meme = Meme.find(params[:id])
		if meme.destroy
			render json:{message: "Its cool"}
		else
			render json:{message: "no Cool"}
		end
	end
	private 
	def permit_params
		params.require(:meme).permit(:id_img, :text_top, :text_buttom)
	end

	def r_not_found(error)
		render json: {error: error.message}, status: :not_found
	end
end