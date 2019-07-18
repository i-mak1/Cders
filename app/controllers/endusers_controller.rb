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
    @enduser = Enduser.find(params[:id])
    @enduser.update(user_params)
    redirect_to enduser_path(@enduser)
  end

  def unsubscribe
  end

  def complete
  end

private

  def user_params
    params.require(:enduser).permit(:email, :first_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :tel)
  end
end
