class AddressesController < ApplicationController
	def create
		binding.pry

		@address = Address.new(product_params)
		@address.save

		redirect_to controller: "orders",action: "new"
	end

	private
  def product_params
    params.require(:address).permit(:university, :campus, :location, 
    																:user_name,:phone_number,:user_id)
  end
end
