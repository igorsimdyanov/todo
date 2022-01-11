namespace :user do
  desc 'Извлекаем статистику по подпунктам пользователя'
  task :items, [:user_id] => :environment do |_t, args|
    args.with_defaults(user_id: User.first.id)
    items = Item.where(event_id: Event.where(user_id: args[:user_id]).ids)
    items.each do |item|
      puts "#{item.id} #{item.name}"
    end
  end
end
