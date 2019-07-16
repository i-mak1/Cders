class EndusersController < ApplicationController
  def show
    @enduser = Enduser.find(current_enduser.id)
    @shipping = Shipping.find(params[:id])
  end

  def edit
    @enduser = Enduser.find(params[:id])
  end

  def update
  end

  def unsubscribe
  end

  def complete
  end
end
