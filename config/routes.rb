Rails.application.routes.draw do
  devise_for :users
  resources :events
  get 'events/page/(:page(.:format))', to: 'events#index'

  get 'about', to: 'about#index', as: 'about_index'

  get 'about/other', to: 'about#index'
  get 'about/:hello', to: 'about#index'

  root 'events#index'
end
