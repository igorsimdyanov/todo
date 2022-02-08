# frozen_string_literal: true

module Entities
  class Event < Grape::Entity
    include ActionView::Helpers::TextHelper
    root 'events', 'event'

    expose :id, :name, :content, :done, :finished_at

    expose :user, using: 'Entities::User' do |event, _|
      event.user
    end

    def name
      truncate(object.name)
    end

    def content
      truncate(object.content)
    end
  end
end
