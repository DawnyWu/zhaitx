class CartsController < ApplicationController
	before_action :authenticate_user!
	# after_action :test
	helper_method :current_user_cart,:cart_quantity,:cart_amount
	helper_method :cart_size	

	def show
		cart_ids = $redis.hkeys current_user_cart
		@cart_products = Product.find(cart_ids)
		@cart_quantity = cart_quantity
		@cart_amount = cart_amount
	end

	def add
		$redis.hset current_user_cart,params[:product_id],params[:number]
	  respond_to do |format|
	  	format.js 
	  end
	end

	def remove
		$redis.hdel current_user_cart,params[:product_id]
	  respond_to do |format|
	  	format.js 
	  end
	end
  
  # 计算所有商品价格
	def amount
	  hash = $redis.hgetall current_user_cart
	  @sum = 0
	  hash.each do |h,v|
	  	@sum = (Product.find(h).price)*(v.to_f)+@sum
	  end
	  respond_to do |format|
	  	format.js 
	  end
	end

	# 改变单个商品数量,以及改变商品总量
	def change_quantity
		$redis.hset current_user_cart,params[:product_id],params[:number]
		# 商品总共有多少个？
		@cart_quantity = cart_quantity
		respond_to do |format|	
			format.js
		end
	end


	private

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
	  sum
	end
	
end
