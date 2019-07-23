class OrdersController < ApplicationController
  before_action :authenticate_enduser!
  def new
    @shippings = current_enduser.shippings
  end

  def payment
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.enduser_id = current_enduser.id
    @order.save!
    redirect_to orders_confirm_path(@order)
  end

  def confirm
    @shipping = Shipping.find
  end


  def complete
  end

  def order_params
    params.require(:order).permit(:payment,:enduser_id)

  end

end
