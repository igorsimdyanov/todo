Rails.application.routes.draw do
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

  get 'about/other', to: 'about#index'
  get 'about/:hello', to: 'about#index'

  root 'events#index'
end
