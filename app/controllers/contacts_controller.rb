class ContactsController < ApplicationController
  def index
    if current_user
      if params[:group]
        @contacts = Group.find_by(name: params[:group]).contacts
      else
        @contacts = current_user.contacts
      end
    else
      redirect_to "/users/sign_in"
    end
  end

  def new
  end

  def create
    address = params[:address]
    # if address == ""
    #   address = "2012 N. Western Ave, Chicago, IL 60608"
    # end
    # coordinates = Geocoder.coordinates(params[:address])

    Contact.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      # latitude: coordinates[0],
      # longitude: coordinates[1],
      user_id: current_user.id
      )
    flash[:success] = "Contact successfully created!"
    redirect_to '/contacts'
  end

  def show
    if current_user
      @contact = Contact.find(params[:id])
    else
      redirect_to "/users/sign_in"
    end
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
