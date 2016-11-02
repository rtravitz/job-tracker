class ContactsController < ApplicationController
  
  def create
    contact = Contact.new(contact_params)
    contact.company_id = params[:company_id]
    contact.save
    flash[:success] = "You added #{contact.full_name} as a contact for #{contact.company.name}!"
    redirect_to company_jobs_path(contact.company) 
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :email, :position, :company_id)
  end

end
