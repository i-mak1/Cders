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

  def update
  end
end
