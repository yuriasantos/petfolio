class VetsController < ApplicationController
  def new
    @vet = Vet.new
    @user = User.new
    @vet.clinic = Clinic.where(user == current_user)
    raise
  end
end
