class OrdersController < ApplicationController

  before_action :check_carts, only:[:new, :create]
  before_action :authenticate_enduser!

  def check_carts
    unless current_enduser.carts.exists?
      flash[:notice] = "カート内が空です"
      redirect_to items_path
    end
  end

  def new
    @shippings = current_enduser.shippings
    @order = Order.new
    @carts = current_enduser.carts
  end

  def payment
     @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.enduser_id = current_enduser.id
    if @order.save!
      current_enduser.carts.destroy_all
      redirect_to orders_complete_path
    end
  end

  def confirm
    @order = Order.find(params[:id])
    @carts = current_enduser.carts
  end


  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment,:enduser_id,:shipping_id,:confirm)

  end

end
