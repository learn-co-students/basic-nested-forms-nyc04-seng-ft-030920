class PeopleController < ApplicationController
  def show
    @person = Person.find(params[:id])
  end
  
  def new
    @person = Person.new
    @person.addresses.build(address_type: 'Home')
    @person.addresses.build(address_type: 'Work')
  end

  def create    
    Person.create(person_params)
    redirect_to person_path(@person)
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(
      :name,
      addresses_attributes: [
      :street_address_1,
      :street_address_2,
      :city,
      :state,
      :zipcode,
      :address_type
    ]
      )
  end
end
