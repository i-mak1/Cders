class AdminLabelsController < ApplicationController
  before_action :authenticate_admin!
  def new
  	@label = Label.new
  end

  def create
  	@label = Label.new(label_params)
    if @label.save
       redirect_to new_admin_item_path
    else
       render :new
    end
  end

  private

  def label_params
    params.require(:label)
          .permit(:label_name)
  end
end