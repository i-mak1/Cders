class AdminEndusersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @endusers = Enduser.all
  end

  def show
    @enduser = Enduser.find(params[:id])
    @shippings = Shipping.where(enduser_id: @enduser.id)
    @orders = Order.where(enduser_id: @enduser.id)
  end

  def edit
    @enduser = Enduser.find(params[:id])
  end

  def update
    @enduser = Enduser.find(params[:id])
    if @enduser.update(enduser_params)
     redirect_to enduser_path(@enduser)
    else
      render :edit
    end
  end

  def destroy
    enduser = Enduser.find(params[:id])
    enduser.destroy
    redirect_to admin_endusers_path
  end

  private

  def enduser_params
    params.require(:enduser).permit(:email, :first_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :tel)
  end
end