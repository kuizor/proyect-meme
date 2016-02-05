class Vote < ActiveRecord::Base
  belongs_to :meme
  belongs_to :user
end
