class AdminContactsController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@contact = Contact.all
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  def update
  	@contact = Contact.find(params[:id])
  	if @contact.update(reply_params)
  		enduser = @contact.enduser
  		flash[:notice] = "お問い合わせへの送信が完了しました。"
  		ContactMailer.send_when_admin_reply(enduser, @contact).deliver
  		redirect_to admin_contacts_path
  	else
  		render "show"
    end
  end


private

  def reply_params
  	params.require(:contact).permit(:reply)
  end
end
