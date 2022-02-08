# frozen_string_literal: true

class EventPolicy < ApplicationPolicy
  def show?
    record.user_id == user.id || user.admin?
  end

  def update?
    record.user_id == user.id || user.admin?
  end

  def destroy?
    record.user_id == user.id || user.admin?
  end

  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end
end
