class AboutController < ApplicationController
  before_action :log_start, :log_params, :log_fihish, only: :index

  def index
    session[:about_count] ||= 0
    session[:about_count] += 1
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
