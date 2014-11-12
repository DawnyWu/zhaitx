class AddressesController < ApplicationController
	def create
		@address = Address.new(product_params)
		@address.save

		# redirect_to controller: "orders",action: "new"

		respond_to do |format|
			format.html {render 'new'}
 	  	format.js 
 	  end
	end

	private
  def product_params
    params.require(:address).permit(:university, :campus, :location, 
    																:user_name,:phone_number,:user_id)
  end
end
