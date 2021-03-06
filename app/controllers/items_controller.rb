class ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).reverse_order.search(params[:search]).without_deleted
    @item_rank = Item.joins(:order_details).select('items.*, order_details.purchase_number, sum(order_details.purchase_number) as purchase_number_count').group("order_details.item_id").order('purchase_number_count desc').limit(5).without_deleted
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
    if @item.deleted?
      redirect_to items_path
    end

  end

end
