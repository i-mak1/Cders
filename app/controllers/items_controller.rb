class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).reverse_order.search(params[:search])
    @item_rank = Item.joins(:order_details).select('items.*, order_details.id, order_id, sum(order_details.purchase_number) as purchase_number_count').group("order_details.id").order('purchase_number_count desc').limit(5)
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
