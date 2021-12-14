Item.destroy_all
Event.destroy_all
User.destroy_all
Role.destroy_all

Role.create(name: 'Пользователь', code: :default)

hash_users = 10.times.map do
  {
    email: FFaker::Internet.safe_email,
    name: FFaker::Internet.user_name,
    role_id: Role.find_by(code: :default).id
  }
end

users = User.create hash_users

# User.default_fresh(Time.mktime(2021, 12, 10)).count

hash_events = 20.times.map do
{
  name: FFaker::Lorem.phrase,
  content: FFaker::Lorem.paragraph,
  user_id: users.sample.id
}
end

events = Event.create hash_events

hash_items = 200.times.map do
  {
    name: FFaker::HipsterIpsum.paragraph,
    event_id: events.sample.id
  }
end
Item.create hash_items
