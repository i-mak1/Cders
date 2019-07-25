class CartsController < ApplicationController
  before_action :authenticate_enduser!
  before_action :check_id, only:[:create]

  def index
    @carts = current_enduser.carts
  end

  def show
    @cart = Cart.find(params[:id])
    @current_stock_number = []
    @cart.item.stock_number.times do |quantity|
      if quantity < 100
        @current_stock_number << quantity + 1
      else
        break
      end
    end
  end


  def update
   @cart = Cart.find(params[:id])
   @cart.update(cart_params)
   redirect_to carts_path
  end

  def destroy
   @cart = Cart.find(params[:id])
   @cart.destroy
   redirect_to carts_path
  end

  def check_id
    carts = current_enduser.carts
    carts.each do |cart|
      if cart.item.id == params[:id].to_i
        flash[:notice] = "既に同じ商品がカートに追加されています。
                          カートから数量を変更して下さい。"
        redirect_to item_path
      end
    end
  end

  def create
  	@item = Item.find(params[:id])
  	@cart = @item.carts.build(cart_params)
  	@cart.enduser_id= current_enduser.id
  	if @cart.save
  		redirect_to carts_path
  	else
  		render 'items#show'
  	end
  end

private

  def cart_params
    params.require(:cart).permit(:enduser_id, :item_id,:quantity)
  end
end