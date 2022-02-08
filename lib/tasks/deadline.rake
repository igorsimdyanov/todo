namespace :deadline do
  desc 'Отправка уведомлений о дедлайнах'
  task mail: :environment do
    events = Event.where(finished_at: DateTime.now..(DateTime.now + 1.day))
    grouped_events = events.group_by { |e| e.user_id }
    grouped_events.each do |user_id, events|
      user = User.find(user_id)
      NotifyMailer.users_deadlines(user, events).deliver_now if user.active
    end
  end
end
