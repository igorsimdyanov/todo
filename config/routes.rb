Rails.application.routes.draw do
  resources :events
  get 'events/page/(:page(.:format))', to: 'events#index'

  get 'about', to: 'about#index', as: 'about_index'

  get 'about/other', to: 'about#index'
  get 'about/:hello', to: 'about#index'

  root 'events#index'
end
