class CartsController < ApplicationController
	before_action :authenticate_user!
	helper_method :current_user_cart
	helper_method :cart_size	

	def show
		cart_ids = $redis.hkeys current_user_cart
		@cart_products = Product.find(cart_ids)
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
		 sum = 0
		 hash.each do |h,v|
		 	sum = (h.to_f)*(v.to_f)+sum
		 end
		 sum
	end

	# 改变单个商品数量
	def change_quantity
		$redis.hset current_user_cart,params[:product_id],params[:number]
		redirect_to action: "show"
	end


	private

	def current_user_cart
		"cart#{current_user.id}"
	end
	
end
