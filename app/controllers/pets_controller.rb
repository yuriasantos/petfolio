class PetsController < ApplicationController


  before_action :set_pet, only: %i[show destroy edit update]


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
    @pet_apo = @pet.appointments.order("datetime DESC")
    @appointment = Appointment.new
    @review = Review.new
    if params[:query].present?
      @pet_apo = @pet_apo.global_search(params[:query])
    else
      @pet_apo = @pet.appointments
    end
    @pet_apo_new = @pet_apo.select { |apo| apo.datetime >= Time.now }
    @pet_apo_old = @pet_apo.select { |apo| apo.datetime < Time.now }
  end

  def destroy
    @pet.destroy
    redirect_to tutor_path(@pet.tutor), notice: "#{@pet.name} was deleted."
  end

  def edit
  end

  def update
    @pet.update(pet_params)

    respond_to do |format|
      format.html { redirect_to pet_path(@pet) }
      format.text { render partial: "pets/edit_pet",
        locals: {pet: @pet}, formats: [:html]
      }
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
