class PetsController < ApplicationController

  def new
    @pets = Pet.find(params[:pet_id])
  end

  def create
  end

  def show
    @pets = Pet.find(params[:id])
  end

end
