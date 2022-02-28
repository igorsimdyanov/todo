# frozen_string_literal: true

namespace :deadline do
  desc 'Отправка уведомлений о дедлайнах'
  task mail: :environment do
    events = Event.where(finished_at: DateTime.now..(DateTime.now + 1.day), done: false)
    grouped_events = events.group_by(&:user_id)
    grouped_events.each do |user_id, user_events|
      user = User.find(user_id)
      NotifyMailer.users_deadlines(user, user_events).deliver_now if user.active
    end
  end
end
