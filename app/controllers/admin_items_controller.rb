class AdminItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  def new
    @item = Item.new
    @item.disks.build
  end

  def create
    @item = Item.new(item_params)
    @item.adminuser_id = current_adminuser.id
    @item.save
    flash[:notice] = "successfully item create"
    redirect_to admin_items
  end

  def update
  end

  private
  def item_params
      params.require(:item).permit(disks_attributes: [:disk_name])
  end

end
