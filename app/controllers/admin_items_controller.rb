class AdminItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
  end


  def show
    @item = Item.includes(:disks => :songs).find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @disk = @item.disks.build
    @song = @disk.songs.build
  end

  def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to admin_items_path
  end

  def new
    @item = Item.new
    @disk = @item.disks.build
    @song = @disk.songs.build
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    flash[:notice] = "successfully item create"
    redirect_to admin_items_path
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item)
  end

private

  def item_params
    params.require(:item).permit(:item_status, :item_name, :stock_number, :artist_id, :price, :label_id, :genre_id, :item_image, disks_attributes: [:id, :disk_name, :_destroy, songs_attributes: [:id, :song_name, :track, :_destroy]])

  end
end
