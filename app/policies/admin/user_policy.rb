# frozen_string_literal: true

module Admin
  class UserPolicy < Admin::ApplicationPolicy
    def index?
      user.admin?
    end

    def toggle?
      user.admin?
    end

    class Scope < Scope
      def resolve
        user.admin? ? scope.all : scope.none
      end
    end
  end
end
