require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task setup: :environment do
    Resque.redis = Redis.new(Rails.application.config_for(:queue))
  end

  task :setup_schedule => :setup do
    require 'resque-scheduler'
    Resque.schedule = YAML.load_file(Rails.root.join('config/resque_schedule.yml'))
    # require 'jobs'
  end

  task :scheduler => :setup_schedule
end

# Запускаем обработчик отложенных задач
# bundle exec rails resque:scheduler

# Пополнение очереди с отложенными задачами
# Resque.enqueue_at_with_queue('default', 5.days, DeadlineEventsCleanupJob)
# DeadlineEventsCleanupJob.set(wait_until: Date.tomorrow.noon).perform_later(1.week.ago)
