class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.clinic?
      new_clinic_path
    # 'Clinic new'
    else
      new_tutor_path
      # Or :prefix_to_your_route
    # 'Tutor new'
    end
  end

end
