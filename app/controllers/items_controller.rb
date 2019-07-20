class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).reverse_order.search(params[:search])
  end

  def show
  	@item = Item.find(params[:id])
  	@cart = Cart.new
  end

  def create
  	@cart = Cart.new(cart_params)
  	@cart.save
  	redirect_to cart_path
  end

  def search
    @items = Item.search(params[:qkeyword])
  end

private

  def cart_params
    params.require(:cart).permit(:cart_id)

  end
end
