class RecordsController < ApplicationController
  def create
    @record = Record.new(record_params)
    @appointment = Appointment.find(params[:appointment_id])
    @record.appointment = @appointment
    if @record.save
      redirect_to vet_path(@appointment.vet)
    else
      render 'vets/show', status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:record).permit(:content)
  end
end
