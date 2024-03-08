class ClinicsController < ApplicationController

  def show
    @clinic = Clinic.find_by(id: params[:id])
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
