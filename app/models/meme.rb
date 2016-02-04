class Meme < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :category_details
  has_many :categories, through: :category_details

  has_many :tag_details
  has_many :tags, through: :tag_details


  before_create :meme_creator
  before_update :meme_vote

  include ServiceRequest
  private
  def meme_creator
    self.vote = 0
		self.link = meme_serv(self.text_top,self.text_buttom,self.id_img)
  end
  def meme_vote
    self.vote =+seft.vote
  end

end
