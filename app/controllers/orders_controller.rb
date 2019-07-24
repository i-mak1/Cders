class OrdersController < ApplicationController
  before_action :authenticate_enduser!
  def new
    @shippings = current_enduser.shippings
    if params[:id].nil?
      @order = Order.new
    else
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

  def purchase
    @order = Order.find(params[:id])
    @carts = current_enduser.carts
    @carts.each do |cart|
      @order_detail = cart.item.order_details.build
      @order_detail.purchase_number = cart.quantity
      @order_detail.purchase_price = (cart.item.price * BigDecimal("1.08")).round * cart.quantity
      cart.item.stock_number -= cart.quantity
      @order_detail.order = @order
      @order_detail.save
      cart.item.save
    end
    @order.update(confirm: true)
    @carts.destroy_all
    redirect_to orders_complete_path
  end


  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment,:enduser_id,:shipping_id,:confirm)

  end

end
