class TutorsController < ApplicationController
  skip_before_action :redirect_user_if_enrollment_incomplete, only: %i[new create]
  before_action :set_tutor, only: %i[show edit update]

  def new
    @tutor = Tutor.new
    authorize @tutor
  end

  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.user = current_user
    authorize @tutor
    if @tutor.save
      redirect_to tutor_path(@tutor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pet = Pet.new
  end

  def edit
  end

  def update
    if @tutor.update(tutor_params)
      redirect_to tutor_path(@tutor), notice: "Updated!"
    else
      render :show, status: :unprocessable_entity
    end

  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def tutor_params
    params.require(:tutor).permit(:fullname, :address, :photo)
  end
end
