class TagDetail < ActiveRecord::Base
  belongs_to :meme
  belongs_to :tag
end
