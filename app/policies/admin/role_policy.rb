module Admin
  class RolePolicy < Admin::ApplicationPolicy
    def index?
      user.admin?
    end

    class Scope < Scope
      def resolve
        user.admin? ? scope.all : scope.none
      end
    end
  end
end
