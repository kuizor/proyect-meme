class User < ActiveRecord::Base
	has_many :memes
	has_many :email_details
	has_many :emails, through: :email_details 

	#before_create :set_auth_token

  	#private
    #def set_auth_token
    #  	return if token.present?
    #  	self.token = generated_token
    #end
end
