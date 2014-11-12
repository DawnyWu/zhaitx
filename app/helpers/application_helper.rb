module ApplicationHelper
  # cart相关的全局helper
	def current_user_cart
		"cart#{current_user.id}"
	end

	def cart_quantity
		array = $redis.hvals current_user_cart
		cart_quantity = array.map(&:to_f).inject(:+).to_i
	end

	def cart_amount
		hash = $redis.hgetall current_user_cart
	  sum = 0
	  hash.each do |h,v|
	   	sum = (Product.find(h).price)*(v.to_f)+sum
	  end
	  sum.round(2)
	end

	def cart_products
		cart_ids = $redis.hkeys current_user_cart
		cart_products = Product.find(cart_ids)		
	end
end
