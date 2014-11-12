class AddressesController < ApplicationController
	def index
		@addresses = current_user.addresses
	end

	def new
	   	
	end

	def create
		@address = Address.new(address_params)
		@address.save
		# redirect_to controller: "orders",action: "new"
		respond_to do |format|
			format.html {redirect_to action: 'index'}
 	  	format.js 
 	  end
	end

	private
  def address_params
    params.require(:address).permit(:university, :campus, :location, 
    																:user_name,:phone_number,:user_id)
  end
end
