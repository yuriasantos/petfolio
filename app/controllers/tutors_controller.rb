class TutorsController < ApplicationController

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.user = current_user
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
    params.require(:tutor).permit(:fullname, :address)
  end
end
