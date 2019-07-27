class ShippingsController < ApplicationController
  before_action :authenticate_enduser!
  def new
  	 @shipping = Shipping.new
  end

  def create
  	 @shipping = Shipping.new(shipping_params)
     @shipping.enduser_id = current_enduser.id
     @shipping.save!
     redirect_to orders_new_path
  end

   private
  def shipping_params
    params.require(:shipping).permit(:enduser_id, :shipping_first_name_kana, :shipping_last_name_kana, :shipping_first_name, :shipping_last_name, :shipping_postcode, :shipping_address)
  end
end