module Admin
  class UserPolicy < Admin::ApplicationPolicy
    def index?
      user.admin?
    end

    def destroy?
      user.admin? && user.id != record.id
    end

    class Scope < Scope
      def resolve
        user.admin? ? scope.all : scope.none
      end
    end
  end
end
