class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.role == "Clinic"
    'Clinic new'
    else
      # Or :prefix_to_your_route
    'Tutor new'
    end
  end

end
