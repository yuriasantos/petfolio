class ClinicsController < ApplicationController
  skip_before_action :redirect_user_if_enrollment_incomplete, only: %i[new create]

  def new
    @clinic = Clinic.new
    authorize @clinic
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.user = current_user
    authorize @clinic
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
