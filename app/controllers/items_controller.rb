class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).reverse_order.search(params[:search])
  end

  def show
  	@item = Item.find(params[:id])
  	@user = current_enduser
  	@cart = @item.carts.build
  	@current_stock_number = []
  	@item.stock_number.times do |quantity|
  		if quantity < 100
  		  @current_stock_number << quantity + 1
  		else
  			break
  		end
  	end

  end

end
