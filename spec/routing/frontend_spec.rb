# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Роутинг', type: :routing do
  it 'GET /about соответствует about#index' do
    expect(get: '/about').to route_to('about#index')
  end

  it 'POST /toggle соответствует locales#toggle' do
    expect(post: '/toggle').to route_to('locales#toggle')
  end

  context 'событий' do
    it 'главная страница соответствует events#index' do
      expect(get: '/').to route_to('events#index')
    end

    it 'POST /events соответствует events#create' do
      expect(post: '/events').to route_to('events#create')
    end

    it 'GET /events/new соответствует events#new' do
      expect(get: '/events/new').to route_to('events#new')
    end

    it 'GET /events/:id/edit соответствует events#edit' do
      expect(get: '/events/1/edit').to route_to('events#edit', id: '1')
    end

    it 'GET /events/1 соответствует events#show' do
      expect(get: '/events/1').to route_to('events#show', id: '1')
    end

    it 'PUT /events/1 соответствует events#update' do
      expect(put: '/events/1').to route_to('events#update', id: '1')
    end

    it 'DELETE /events/1 соответствует events#destroy' do
      expect(delete: '/events/1').to route_to('events#destroy', id: '1')
    end

    it 'GET /events/page/1 соответствует events#index' do
      expect(get: '/events/page/1').to route_to('events#index', page: '1')
    end
  end
end
# rubocop:enable Metrics/BlockLength
