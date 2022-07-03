# frozen_string_literal: true

Resque.redis = Redis.new(Rails.application.config_for(:queue))
