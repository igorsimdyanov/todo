module Entities
  class User < Grape::Entity
    include ActionView::Helpers::TextHelper
    root 'users', 'user'

    expose :id, :name

    expose :role, using: 'Entities::Role' do |user, _|
      user.role
    end
  end
end