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
    @tutor.update(tutor_params)

    respond_to do |format|
      format.html { redirect_to tutor_path(@tutor) }
      format.text { render partial: "tutors/edit_tutor",
        locals: {tutor: @tutor}, formats: [:html]
      }
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
