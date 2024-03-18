class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @tutor = current_user.tutor
    @appointment = Appointment.find(params[:appointment_id])
  end

  def create
    @review = Review.new(review_params)
    @appointment = Appointment.find(params[:appointment_id])
    @review.appointment = @appointment
    if @review.save
      redirect_to pet_path(@appointment.pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:clinic_rating, :content)
  end
end
