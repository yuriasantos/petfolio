class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
    @tutor = current_user.tutor
    @clinic = Clinic.find(params[:clinic_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @clinic = Clinic.find(params[:clinic_id])
    if @appointment.save
      redirect_to clinic_path(@clinic)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def vets_appointments
    @appointments = policy_scope(Appointment)
    custom_response = @product.rentals.map do |rental|
      {
        start_date: rental.start_date,
        end_date: rental.end_date
      }
    end
    render json: custom_response
  end

  private

  def appointment_params
    params.require(:appointment).permit(:datetime, :pet_id, :vet_id)
  end
end
