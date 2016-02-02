class EmailDetail < ActiveRecord::Base
  belongs_to :meme
  belongs_to :email
end
