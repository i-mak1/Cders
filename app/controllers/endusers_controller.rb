class EndusersController < ApplicationController
  def show
    @enduser = Enduser.find(current_enduser.id)
    @shipping = Shipping.where(user_id:current_enduser.id)
    @order = Order.where(user_id:current_enduser.id)
  end

  def edit
    @enduser = Enduser.find(current_enduser.id)
  end

  def update
  end

  def unsubscribe
  end

  def complete
  end
end
