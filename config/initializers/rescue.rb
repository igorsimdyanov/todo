require 'resque-scheduler'
require 'resque/scheduler/server'

Resque.redis = Redis.new(Rails.application.config_for(:queue))
