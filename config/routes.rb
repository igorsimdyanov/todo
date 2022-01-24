Rails.application.routes.draw do
  post :toggle, to: 'locales#toggle'
  namespace :admin do
    root 'users#index'
    resources :users
    resources :roles
  end
  devise_for :users
  resources :events do 
    resources :items
  end

  get 'events/page/(:page(.:format))', to: 'events#index'

  get 'about', to: 'about#index', as: 'about_index'
  scope '/:locale' do
    get 'about', to: 'about#index'
  end

  root 'events#index'
end
