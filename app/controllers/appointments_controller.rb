class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
    @pet = Pet.find_by(id: params[:id])
    @vet = Vet.find_by(id: params[:id])
    @tutor = Tutor.find_by(id: params[:id])
  end

end
