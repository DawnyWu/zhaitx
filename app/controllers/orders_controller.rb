class OrdersController < ApplicationController

	def new
		@address = Address.find(1);
	end
	
	def create
		binding.pry
		
	end

	def show
		
	end
end
