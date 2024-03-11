class PetsController < ApplicationController
  def new
    @tutor = Tutor.find_by(user: current_user)
    @pet = Pet.new
  end

  def create
    @tutor = Tutor.find_by(user: current_user)
    @pet = Pet.new(pet_params)
    @pet.tutor = @tutor
    if @pet.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pets = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :birth, :photo)
  end
end
