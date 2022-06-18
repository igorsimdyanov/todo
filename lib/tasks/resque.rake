# frozen_string_literal: true

namespace :resque do
  task setup: :environment do
    Resque.redis = Redis.new(Rails.application.config_for(:queue))
  end
end
