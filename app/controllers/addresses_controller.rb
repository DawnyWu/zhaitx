class AddressesController < ApplicationController
	def create
		binding.pry
		redirect_to controller: "orders",action: "new"
	end
end
