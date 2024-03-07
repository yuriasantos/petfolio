class ClinicsController < ApplicationController

  def show
    #  show clinic
    #  view clinic.appointment.each do |appointment|
      # clinic.appointment.datetime
    # end
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.user = current_user
    if @clinic.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def clinic_params
    params.require(:clinic).permit(:cnpj, :address, :company_name)
  end

end
