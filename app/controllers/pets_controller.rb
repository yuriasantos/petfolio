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
      redirect_to tutor_path(@tutor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @pet_apo = @pet.appointments
    @appointment = Appointment.new
    @review = Review.new

    if params[:query].present?
      @pet_apo = @pet_apo.global_search(params[:query])
    end

  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :birth, :photo)
  end
end
