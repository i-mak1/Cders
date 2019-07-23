class OrdersController < ApplicationController
  def new
    @shippings = current_enduser.shippings
    if params[:id].nil?
      p "nil"
      @order = Order.new
    else
      p "not nil"
      @order = Order.find(params[:id])
    end
  end

  def payment
     @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.enduser_id = current_enduser.id
    @order.save!
    redirect_to orders_payment_path(@order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order.update!(order_params)
    redirect_to orders_payment_path(@order)
  end

  def select
    @order = Order.find(params[:id])
    @order.update!(order_params)
    redirect_to orders_confirm_path(@order)
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
