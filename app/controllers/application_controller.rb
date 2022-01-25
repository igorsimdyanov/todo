class ApplicationController < ActionController::Base
  include Pundit
  before_action :devise_permit_params, if: :devise_controller?
  before_action :check_locale

  private

  def check_locale
    I18n.locale = session[:locale] if I18n.available_locales.include? session[:locale]&.to_sym
  end

  def devise_permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
