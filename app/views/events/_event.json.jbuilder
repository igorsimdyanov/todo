# frozen_string_literal: true

json.ignore_nil!
json.extract! event, :id
json.name truncate(event.name)
json.content truncate(event.content)
json.extract! event, :finished_at, :created_at, :updated_at
json.user do
  json.id event.user.id
  json.name event.user.name
  json.email event.user.email
end
json.url event_url(event, format: :json)
