class RecordsController < ApplicationController
  def create
    @record = Record.new(record_params)
    @appointment = Appointment.find(params[:appointment_id])
    @record.appointment = @appointment
    # if @record.save
    #   redirect_to vet_path(@appointment.vet)
    # end

    respond_to do |format|
      if @record.save
        format.html { redirect_to vet_path(@appointment.vet) }
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "vets/show", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def record_params
    params.require(:record).permit(:content)
  end
end
