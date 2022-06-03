# frozen_string_literal: true

RSpec.describe AboutController, type: :controller do
  describe 'GET /about' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
