class CartsController < ApplicationController
	before_action :authenticate_user!
	helper_method :current_user_cart
	helper_method :cart_size	

	def show
		cart_ids = $redis.smembers current_user_cart
		@cart_products = Product.find(cart_ids)
	end

	def add
		$redis.sadd current_user_cart,params[:product_id]
		#binding.pry
	  #render json: $redis.scard(current_user_cart), status: 200
	  respond_to do |format|
	  	format.js 
	  end
	end

	def remove
		$redis.srem current_user_cart,params[:product_id]
	  respond_to do |format|
	  	format.js 
	  end
	end



	private

	def current_user_cart
		"cart#{current_user.id}"
	end
	
end
