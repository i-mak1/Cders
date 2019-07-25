class AdminOrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	
  end

  def update
  end
end
