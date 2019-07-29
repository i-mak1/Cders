class AdminEndusersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @endusers = Enduser.all.without_deleted
  end

  def show
    @enduser = Enduser.find(params[:id])
    @order = @enduser.orders.sort_by {|record| record.created_at}.reverse!
    if @enduser.deleted?
      redirect_to admin_endusers_path
    end
  end

  def edit
    @enduser = Enduser.find(params[:id])
    if @enduser.deleted?
      redirect_to admin_endusers_path
    end
  end

  def update
    @enduser = Enduser.find(params[:id])
    if @enduser.update!(enduser_params)
     redirect_to admin_enduser_path(@enduser)
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