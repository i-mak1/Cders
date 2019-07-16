class AdminItemsController < ApplicationController
  def index
    @items = Item.all
  end


  def show
    @item = Item.includes(:disks => :songs).find(params[:id])
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

          .permit(:item_name, :artist_id, :price, :label_id, :genre_id, :item_image, disks_attibutes: [:disk_id, :disk_name, :_destroy], songs_attibutes: [:song_id, :song_name, :track, :_destroy])

  end
end
