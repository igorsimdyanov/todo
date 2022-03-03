# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :devise_permit_params, if: :devise_controller?

  def after_sign_in_path_for(user)
    user.admin? ? admin_root_path : root_path
  end

  def access_denied(exception)
    sign_out
    redirect_to root_path
  end

  private

  def devise_permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email avatar])
  end
end
