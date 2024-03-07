class PetsController < ApplicationController

  def new
    @pets = Pet.find(params[:pet_id])
  end

  def create
  end

end
