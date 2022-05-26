RSpec.describe Events, type: :api do
  before do
    create(:event)
    create(:event, done: true)
  end

  context 'список событий' do
    let(:events) { json_dig('events') }

    it 'GET /api/events' do
      get '/api/events'
      expect(last_response.status).to eq 200
    end

    it 'содержит одно незавершенное дело' do
      get '/api/events'
      expect(events.count).to eq 1
    end

    it 'с параметром all выводятся все события' do
      get '/api/events?all=true'
      expect(events.count).to eq 2
    end
  end

  context 'детальное событие' do
    let(:event) { create(:event) }
    let(:event_response) { json_dig('event') }
    let(:event_json) do
      include(
        'id' => a_value > 0,
        'name' => be_an(String),
        'content' => be_an(String),
        'done' => eq(true) | eq(false),
        'user' => hash_including(
            'id' => a_value > 0,
            'name' => be_an(String),
            'role' => be_an(String)
          )
      )
    end

    it 'GET /api/events/:id' do
      get "/api/events/#{event.id}"
      expect(last_response.status).to eq 200
    end

    it 'отдает правильную структуру' do
      get "/api/events/#{event.id}"
      expect(event_response).to event_json
    end
  end
end
