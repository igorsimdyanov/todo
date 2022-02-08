# frozen_string_literal: true

module Entities
  class EventIndex < Grape::Entity
    include ActionView::Helpers::TextHelper
    root 'events', 'event'

    expose :id, :name, :content, :done, :finished_at

    def name
      truncate(object.name)
    end

    def content
      truncate(object.content)
    end
  end
end
