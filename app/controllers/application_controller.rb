class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_admin_user!
  before_action :set_locale

  layout :select_layout

  def select_layout
    if is_a?(Devise::SessionsController)
      false
    elsif self.class.parent == Admin
      'admin'
    else
      'application'
    end
    # only turn it off for sign_in/sign_up pages:
    is_a?(Devise::SessionsController) ? false : 'admin'
  end

  def set_locale
    I18n.locale = params[:locale] || http_accept_language.compatible_language_from(I18n.available_locales)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  protected
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_dashboard_path
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || new_admin_user_session_path
  end
end
