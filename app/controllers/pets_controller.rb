class PetsController < ApplicationController

  before_action :set_pet, only: %i[show destroy edit update]

  def new
    @tutor = Tutor.find_by(user: current_user)
    @pet = Pet.new
  end

  def create
    @tutor = Tutor.find_by(user: current_user)
    @pet = Pet.new(pet_params)
    @pet.tutor = @tutor
    if @pet.save
      redirect_to tutor_path(@tutor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pet_apo = @pet.appointments

    if params[:query].present?
      @pet_apo = @pet_apo.global_search(params[:query])
    end

  end

  def destroy
    @pet.destroy
    redirect_to tutor_path(@pet.tutor), notice: "#{@pet.name} was deleted."
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet), notice: "Updated!"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :birth, :photo)
  end
end
