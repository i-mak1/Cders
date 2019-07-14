class AdminItemsController < ApplicationController
  def index
    @item = Items.all
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def new
    @item = Items.new
  end

  def create
    @item = Items.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:notice] = "successfully item create"
      redirect_to admin_items(@item.id)
    else
      @user = current_user
      @items = Item.all
      render :index
    end
  end

  def update
  end
end
