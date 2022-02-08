# frozen_string_literal: true

class AboutController < ApplicationController
  before_action :log_start, :log_params, :log_fihish, only: :index

  def index
    session[:about_count] ||= 0
    session[:about_count] += 1
    I18n.locale = session[:locale] if I18n.available_locales.include? session[:locale]&.to_sym
  end

  private

  def log_start
    Rails.logger.info '####################################'
  end

  alias log_fihish log_start

  def log_params
    Rails.logger.info params.inspect
    Rails.logger.info params[:locale]
  end
end
