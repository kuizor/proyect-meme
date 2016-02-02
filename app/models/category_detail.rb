class CategoryDetail < ActiveRecord::Base
  belongs_to :category
  belongs_to :meme
end
