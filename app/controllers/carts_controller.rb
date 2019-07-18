class CartsController < ApplicationController
  def show
  	@cart = current_enduser.carts
  end

  def update
   @cart = Cart.find(params[:id])
   @cart.update(cart_params)
   redirect_to cart_path(@cart)
  end

  def destroy
   @cart = Cart.find(params[:id])
   @cart.destroy
   redirect_to cart_path
  end

  def create
  	@item = Item.find(params[:id])
  	@cart = @item.carts.build(cart_params)
  	@cart.enduser_id= current_enduser.id
  	if @cart.save
  		redirect_to cart_path
  	else
  		render 'items#show'
  	end
  end

private

  def cart_params
    params.require(:cart).permit(:enduser_id, :item_id,:quantity)

  end

end