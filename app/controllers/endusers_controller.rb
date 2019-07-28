class EndusersController < ApplicationController
  before_action :authenticate_enduser!, only: [:show, :edit, :update, :unsubscribe]
  def show
    @enduser = Enduser.find(params[:id])
    @order = @enduser.orders.sort_by {|record| record.created_at}.reverse!
    unless @enduser == current_enduser
      redirect_to enduser_path(current_enduser)
    end
  end

  def edit
    @enduser = Enduser.find(params[:id])
    unless @enduser == current_enduser
      redirect_to enduser_path(current_enduser)
    end
  end

  def update
    @enduser = Enduser.find(params[:id])
    @enduser.update(enduser_params)
    redirect_to enduser_path(@enduser)
  end

  def destroy
    @enduser = Enduser.find(params[:id])
    @enduser.destroy
    @enduser.update(email: @enduser.deleted_at.to_i.to_s + '_' + @enduser.email.to_s)
    redirect_to endusers_complete_path
   end

  def unsubscribe
    @enduser = Enduser.find(params[:id])
    unless @enduser == current_enduser
      redirect_to enduser_path(current_enduser)
    end
  end

  def complete
  end

private

  def enduser_params
    params.require(:enduser).permit(:email, :first_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :tel)
  end
end
