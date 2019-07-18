class OrdersController < ApplicationController
  def new
    @shippings = current_enduser.shippings
  end

  def payment
  end

  def confirm
  end


  def complete
  end

end
