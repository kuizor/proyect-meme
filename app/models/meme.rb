class Meme < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :tagdetails
  has_many :tags, through: :tagdetails
end
