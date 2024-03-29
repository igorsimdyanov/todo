# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { create(:event) }
  let(:event_own) { create(:event, user: user) }

  before { sign_in(user) }

  it :index do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'пользователь не может видеть не свои сообщения' do
    expect do
      get :show, params: { id: event.id }
    end.to raise_error(Pundit::NotAuthorizedError)
  end

  it 'пользователь может видеть свои сообщения' do
    get :show, params: { id: event_own.id }
    expect(response).to have_http_status(:success)
  end

  it :new do
    get :new
    expect(response).to have_http_status(:success)
  end

  it :create do
    post :create, params: { event: attributes_for(:event) }
    expect(response).to have_http_status(:redirect)
  end

  it 'при создании события количество events-записей увеличивается на 1' do
    expect do
      post :create, params: { event: attributes_for(:event) }
    end.to change(Event, :count).by 1
  end
end
# rubocop:enable Metrics/BlockLength
