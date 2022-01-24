class EventsScopeService
  attr_reader :user, :scope

  def initialize(user, scope)
    @user = user
    @scope = scope
  end

  def self.call(user, scope)
    new(user, scope).call
  end

  def call
    user.admin? ? scope.all : scope.where(user: user)
  end
end
