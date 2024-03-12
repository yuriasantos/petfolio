class TutorsController < ApplicationController
  skip_before_action :redirect_user_if_enrollment_incomplete, only: %i[new create]

  def new
    @tutor = Tutor.new
    authorize @tutor
  end

  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.user = current_user
    authorize @tutor
    if @tutor.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tutor = Tutor.find(params[:id])
  end

  private

  def tutor_params
    params.require(:tutor).permit(:fullname, :address, :photo)
  end
end
