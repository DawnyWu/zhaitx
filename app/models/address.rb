class Address < ActiveRecord::Base
	belongs_to :user
	validates :university,:campus,:location,:user_name,:phone_number,:user_id,
	          presence: true
end
