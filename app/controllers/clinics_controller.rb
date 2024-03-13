class ClinicsController < ApplicationController
  skip_before_action :redirect_user_if_enrollment_incomplete, only: %i[new create]

  skip_before_action :authenticate_user!, only: :index

  before_action :set_clinic, only: %i[show edit update]

  def index
    if params[:query].present?
      @clinics = Clinic.search_by_name(params[:query])
    else
      @clinics = Clinic.all
    end

    @markers = @clinics.geocoded.map do |clinic|
      {
        lat: clinic.latitude,
        lng: clinic.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {clinic:})
      }
    end
  end

  def show
    @clinic_apo = @clinic.appointments

    if params[:query].present?
      @clinic_apo = @clinic_apo.global_search(params[:query])
    end

  end

  def new
    @clinic = Clinic.new
    authorize @clinic
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.user = current_user
    authorize @clinic
    if @clinic.save
      redirect_to clinic_path(@clinic)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @clinic.update(clinic_params)
      redirect_to clinic_path(@clinic), notice: "Updated!"
    end
  end


  private

  def set_clinic
    @clinic = Clinic.find_by(id: params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:cnpj, :address, :company_name, :photo)
  end
end
