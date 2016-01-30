class Tag < ActiveRecord::Base
	has_many :tagdetails
	has_many :memes through: :tagdetails
end
