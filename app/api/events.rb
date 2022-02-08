class Events < Grape::API
  include Grape::Kaminari
  helpers FiltersHelper, EventsHelper

  resource :events do
    desc 'Список дел'
    params do
      use :filters
      use :pagination, per_page: 2, max_per_page: 2, offset: 0
    end
    get '/' do
      # scope = EventPolicy::Scope.new(current_user, events_scope(params[:all])).resolve

      present paginate(events_scope(params[:all])), with: Entities::EventIndex
    end

    route_param :event_id, type: Integer do
      before do
        # scope = EventPolicy::Scope.new(current_user, Event).resolve
        @event = Event.find params[:event_id]
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
