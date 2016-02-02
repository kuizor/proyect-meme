class Email < ActiveRecord::Base
	has_many :email_details
end
