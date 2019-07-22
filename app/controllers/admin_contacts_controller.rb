class AdminContactsController < ApplicationController
  def index
  	@admin_endusers = Enduser.all
  end

  def show
  	@enduser = Enduser.find(params[:id])
  end

  def create
  end
end
