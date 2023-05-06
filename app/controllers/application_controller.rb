class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  include FlashHelper

  before_action :set_paper_trail_whodunnit
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :pundishing_user

  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    signup_params = %i[full_name]

    # Add other fields that can be edited from the user's profile page here
    edit_user_params = []

    devise_parameter_sanitizer.permit(:sign_up, keys: signup_params)
    devise_parameter_sanitizer.permit(:account_update, keys: signup_params + edit_user_params)
  end

  private

  def pundishing_user
    flash_message(:error, 'Not Authorized', 'You are not authorized to perform this action.')
    redirect_to root_path
  end

  def layout_by_resource
    if devise_controller? && !(resource_name == :user && action_name == 'edit')
      'application_devise'
    else
      'application'
    end
  end
end
