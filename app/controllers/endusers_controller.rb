class EndusersController < ApplicationController
  def show
    @enduser = Enduser.find(params[:id])
    @shipping = @enduser.shippings
    @order = @enduser.orders
  end

  def edit
    @enduser = Enduser.find(params[:id])
  end

  def update
    @enduser = Enduser.find(params[:id])
    @enduser.update(enduser_params)
  end

  def unsubscribe
  end

  def complete
  end

private

  def enduser_params
    params.require(:enduser).permit(:email, :first_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :tel)
  end
end
