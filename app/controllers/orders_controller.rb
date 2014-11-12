class OrdersController < ApplicationController
	def index
		
	end

	def new
		@address = Address.find(params[:address_id])
	end
	
	def create
		user_id = current_user.id
		remark = params[:order][:remark]
		address_id = params[:order][:address_id] 
		order = Order.new(user_id: user_id,remark: remark,address_id:address_id)
		order.save
		redirect_to show_order_path(order)
	end

	def show
		@order = Order.find(params[:order_id])
	end

	private
  def order_params
    params.require(:order).permit(:remark,:address_id)
  end
end
