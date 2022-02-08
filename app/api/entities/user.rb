# frozen_string_literal: true

module Entities
  class User < Grape::Entity
    include ActionView::Helpers::TextHelper
    root 'users', 'user'

    expose :id, :name, :role

    def role
      object.role.code
    end
  end
end
