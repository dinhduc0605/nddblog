# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_admin_user!, if: :admin_page
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
  end

  def set_locale
    I18n.locale = params[:locale] || http_accept_language.compatible_language_from(I18n.available_locales)
  end

  def raise_not_found
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end

  def render_error_page(error_code)
    case error_code
    when 404
      render 'static_pages/error_404', status: :not_found
    else
      render 'static_pages/error_500', status: :internal_server_error
    end
  end

  rescue_from StandardError do |e|
    raise e if Rails.env.development?
    if e.is_a?(ActionController::RoutingError) || e.is_a?(ActiveRecord::RecordNotFound)
      render_error_page(404)
    elsif e.is_a?(ActionController::InvalidAuthenticityToken)
      redirect_to :back
    else
      render_error_page(500)
      Rollbar.error(e)
    end
  end

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || admin_dashboard_path
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || new_admin_user_session_path
  end

  def admin_page
    self.class.parent == Admin
  end
end
