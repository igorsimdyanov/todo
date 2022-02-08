module EventsHelper
  extend Grape::API::Helpers

  def events_scope(all)
    scope = Event.includes(user: :role).order(:id)
    all ? scope : scope.where(done: false)
  end
end
