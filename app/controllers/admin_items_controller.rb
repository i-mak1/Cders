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
  end

private

  def item_params
    params.require(:item)
          .permit(:artist_name, :price, :label_name, :genre_name, :item_image, disks_attibutes: [:id, :disk_name, :_destroy], songs_attibutes: [:id, :song_name, :_destroy])

  end
end
