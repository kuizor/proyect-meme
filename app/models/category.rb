class Category < ActiveRecord::Base
	has_one :category_details
end
