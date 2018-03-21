class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_admin_user!
  layout :off_application_layout

  def off_application_layout
    # only turn it off for sign_in/sign_up pages:
    is_a?(Devise::SessionsController) ? false : 'application'
  end

  protected
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_root_path
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || new_admin_user_session_path
  end
end
