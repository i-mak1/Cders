class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	@contact.save!
  	flash[:notice] = "お問い合わせを承りました。"
  	redirect_to items_path
  end

private

  def contact_params
  	params.require(:contact).permit(:contact, endusers_attributes: [:email, :first_name, :last_name])
  end
end
