require 'rails_helper'

describe Events do
  include Rack::Test::Methods

  describe 'GET /api/events' do
    it 'return success' do
      get '/api/events'
      expect(last_response.status).to eq(200)
    end
  end

  describe 'GET /api/events/{event_id}' do
    let(:event) { create(:event) }

    it 'return success' do
      get "/api/events/#{event.id}"
      expect(last_response.status).to eq(200)
    end
  end
end
