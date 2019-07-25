class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
    @enduser = current_enduser
  end

  def create
    @enduser = current_enduser
  	@contact = Contact.new(contact_params)
    @contact.enduser_id = current_enduser.id
      if @contact.save
  	    flash[:notice] = "お問い合わせを承りました。回答につきましては、メールにてご連絡致します。"
  	    redirect_to items_path
      else
        render :new
      end
  end

private

  def contact_params
  	params.require(:contact).permit(:contact)
  end
end

