class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
  end

  def create
    Contact.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    flash[:success] = "Contact successfully created!"
    redirect_to '/contacts'
  end

  def show
    contact_id = params[:id]
    @contact = Contact.find(params[:id])
  end

  def edit
    # contact_id = params[:id]
    # @contact = Contact.find_by(id: contact_id)
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    flash[:success] = "Contact successfully updated!"
    redirect_to '/contacts'
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:success] = "Logged out!"
    redirect_to '/contacts'
  end

  def coordinates
    coordinates = Geocoder.coordinates(@address)
  end
end
