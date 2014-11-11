module ApplicationHelper
	def current_user_cart
		"cart#{current_user.id}"
	end
	def cart_quantity
		array = $redis.hvals current_user_cart
		cart_quantity = array.map(&:to_f).inject(:+).to_i
	end
end
