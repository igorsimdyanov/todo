class Events < Grape::API
  helpers FiltersHelper, EventsHelper

  resource :events do
    desc 'Список дел'
    params do
      use :filters
    end
    get '/' do
      scope = EventPolicy::Scope.new(current_user, events_scope(params[:all])).resolve

      present scope, with: Entities::EventIndex
    end

    route_param :event_id, type: Integer do
      before do
        scope = EventPolicy::Scope.new(current_user, Event).resolve
        @event = scope.find params[:event_id]
      end

      get '/' do
        present @event, with: Entities::Event
      end

      post '/' do
        @event.destroy
      end
    end
  end
end
