Comment.destroy_all
Item.destroy_all
Event.destroy_all
User.destroy_all
Role.destroy_all

default_role = Role.create!(name: 'Пользователь', code: :default)
admin_role = Role.create!(name: 'Администратор', code: :admin)

email = 'admin@example.com'
User.create! email: email,
             password: email,
             name: 'Администратор',
             role: admin_role

hash_users = 10.times.map do
  email = FFaker::Internet.safe_email
  {
    email: email,
    password: email,
    name: FFaker::Internet.user_name[0..15],
    role: default_role
  }
end

users = User.create! hash_users

hash_events = 20.times.map do
{
  name: FFaker::Lorem.phrase,
  content: FFaker::Lorem.paragraph,
  user: users.sample
}
end

events = Event.create! hash_events

hash_items = 200.times.map do
  {
    name: FFaker::HipsterIpsum.paragraph,
    event: events.sample
  }
end
Item.create hash_items

hash_comments = 200.times.map do
  commentable = (rand(2) == 1 ? events : users).sample

  {
    content: FFaker::Lorem.paragraph,
    user: users.sample,
    commentable_id: commentable.id,
    commentable_type: commentable.class.to_s
  }
end

Comment.create! hash_comments
