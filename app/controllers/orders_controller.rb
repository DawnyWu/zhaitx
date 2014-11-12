class OrdersController < ApplicationController

	def new
		@address = Address.find(params[:address_id])
	end
	
	def create
		binding.pry
		# user_id: current_user.id
		# remark: params[:order][:remark]
		# address_id: params[:order][:address_id] 
		Order.new(params[:order])
	end

	def show
		
	end

	private
  def order_params
    params.require(:order).permit(:remark)
  end
end
