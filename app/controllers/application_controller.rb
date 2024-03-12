class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_user_if_enrollment_incomplete, if: :user_signed_in?
  # before_action :redirect_sign_in, if: :user_signed_in?

  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  # Checks if user completed his enrollment process
  def redirect_user_if_enrollment_incomplete
    if current_user.tutor? && Tutor.where(user: current_user).none?
      redirect_to new_tutor_path
    elsif current_user.clinic? && Clinic.where(user: current_user).none?
      redirect_to new_clinic_path
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.clinic?
      clinic_path(current_user.clinic)
    elsif current_user.tutor?
      tutor_path(current_user.tutor)
    elsif current_user.vet?
      vet_path(current_user.vet)
    end
  end

  private

  def skip_pundit?
    :devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
