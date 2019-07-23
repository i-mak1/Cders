class AdminEndusersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @endusers = Enduser.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
