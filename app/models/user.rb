class User < ActiveRecord::Base
	has_many :user_details
	has_many :memes, through: :user_details
	has_many :email_details
	has_many :emails, through: :email_details 
end
