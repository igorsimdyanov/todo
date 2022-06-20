# frozen_string_literal: true

namespace :deadline_tasks do
  desc 'Пометка просроченных задача выполнеными'
  task cleanup: :environment do
    DeadlineEventsCleanupJob.perform_now 1.week.ago
  end
end
