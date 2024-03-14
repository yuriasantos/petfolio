class VetsController < ApplicationController

  before_action :set_vet, only: %i[show destroy edit update]

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
  end

  def destroy
    @vet.destroy
    redirect_to clinic_path(@vet.clinic), notice: "#{@vet.fullname} was deleted."
  end

  def edit
  end

  def update
    @vet.update(vet_params)

    respond_to do |format|
      format.html { redirect_to vet_path(@vet) }
      format.text { render partial: "vets/profile_card",
        locals: {vet: @vet}, formats: [:html]
      }
    end
  end

  private

  def set_vet
    @vet = Vet.find(params[:id])
  end

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
