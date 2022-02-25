class DeadlineEventsCleanupJob < ApplicationJob
  queue_as :default

  def perform(ago = 1.week.ago)
    Event.where('finished_at <= ?', ago).update(done: true)
  end
end
