# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :devise_permit_params, if: :devise_controller?

  private

  def devise_permit_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
