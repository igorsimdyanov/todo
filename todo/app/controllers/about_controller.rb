class AboutController < ApplicationController
  def index
    Rails.logger.info '####################################'
    Rails.logger.info params.inspect
    Rails.logger.info params[:locale]
    Rails.logger.info '####################################'
  end
end
