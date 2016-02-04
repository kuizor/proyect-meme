class MemesController < ApplicationController
	#before_action :authenticate
	before_action :authenticate, except: [:index, :update]
	
	def index
		if (request.headers['Authorization']==nil)
			meme = Meme.where(type_meme: "PUBLIC")
			render json: meme
		else
			meme = Meme.where(type_meme: "PUBLIC")
			token =request.headers['Autorization']
			user = User.find_by(token: token)
			priv = Meme.where(user_id: user,type_meme:'PRIVATED')
			render json: meme+priv
		end
	end
	def show
		meme = Meme.find(params[:id])
		render json: meme
	end

	def create
		meme = Meme.new(permit_params)
		if meme.save
			render json:{link: "#{meme.link}"}
		else
			render json:{message: "No cool", errors: meme.errors.full_message}
		end
	end
	def update
		meme = Meme.find_by(params[:id])
		if meme.update(permit_params)
			render json:meme
		else
			render json:{message: "Errors!"}
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
		params.require(:meme).permit(:id_img, :text_top, :text_buttom,:type_meme, :vote)
	end

	def r_not_found(error)
		render json: {error: error.message}, status: :not_found
	end
	def user_token
		token =request.headers['Authorization']
		@user = User.find_by(token: token)
		@privated = Meme.find_by(type_meme: "PRIVATED", user_id: @user)
	end
end

