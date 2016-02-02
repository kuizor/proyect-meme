class EmailDetail < ActiveRecord::Base
  belongs_to :user
  belongs_to :email
end
