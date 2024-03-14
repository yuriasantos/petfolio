class VetsController < ApplicationController
  def new
    @vet = Vet.new
    @user = User.new
    @vet.clinic = Clinic.find_by(user: current_user)
    authorize @vet
  end

  def create
    @user = User.new(user_params)
    @vet = Vet.new
    @user.role = "vet"
    authorize @vet
    if @user.save
      fill_new_vet
      if @vet.save
        redirect_to clinic_path(@vet.clinic)
      else
        User.delete(@user)
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @vet = Vet.find(params[:id])
    authorize @vet
    @vet_appointments = @vet.appointments.map do |appointment|
      appointment.datetime.to_date.to_s
    end
  end

  def appointments_list
    @vet = Vet.find(params[:id])
    @record = Record.new
    respond_to do |format|
      format.text { render partial: "vets/appointments_list", locals: { vet_appointments: @vet.appointments, record: @record}, formats: [:html] }
    end
  end

  private

  def vet_params
    params.require(:vet).permit(:fullname, :crmv, :specialty, user: %i[email password])
  end

  def user_params
    params[:vet].require(:user).permit(:email, :password)
  end

  def fill_new_vet
    @vet.fullname = vet_params[:fullname]
    @vet.crmv = vet_params[:crmv]
    @vet.specialty = vet_params[:specialty]
    @vet.clinic = Clinic.find_by(user: current_user)
    @vet.user = @user
  end
end
