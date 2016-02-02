class Meme < ActiveRecord::Base
  belongs_to :category 

  before_create :meme_creator

  include ServiceRequest
  private
  	def meme_creator
		#puts "-->",meme_serv("Hola","Como estas?","Dv99KQ") 
		self.link = meme_serv(self.text_top,self.text_buttom,self.id_img)
		
	end
end
