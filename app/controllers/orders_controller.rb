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

  def create
    @order = Order.new(order_params)
    @order.enduser_id = current_enduser.id
    @shippings = current_enduser.shippings
    @carts = current_enduser.carts
    if @order.save
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
      current_enduser.carts.destroy_all
      redirect_to orders_complete_path
    else render :new
    end
  end

  def confirm
    @order =  Order.new(order_params)
    @carts = current_enduser.carts
    @shipping = Shipping.find_by(id: params[:order][:shipping_id])
    if @shipping.blank?
      flash[:notice] = "送付先を登録してください。"
      redirect_to orders_new_path
    else :confirm
    end
  end

  def complete
  end


 private
  def order_params
    params.require(:order).permit(:payment,:enduser_id,:shipping_id)

  end

end
