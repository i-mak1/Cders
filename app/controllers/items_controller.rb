class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).reverse_order.search(params[:search])
  end

  def show
  	@item = Item.find(params[:id])
  	@user = current_enduser
  	@cart = @item.carts.build
  end

end
