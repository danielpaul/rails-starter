class ConfirmationsController < Devise::ConfirmationsController
  protected

  def after_resending_confirmation_instructions_path_for(resource_name)
    confirm_email_path(email: params[resource_name][:email])
  end

  def after_confirmation_path_for(_resource_name, resource)
    sign_in resource
    stored_location_for(resource) || root_path
  end
end
