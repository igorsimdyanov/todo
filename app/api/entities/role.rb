module Entities
  class Role < Grape::Entity
    root 'roles', 'role'

    expose :code
  end
end