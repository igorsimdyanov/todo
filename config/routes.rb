# frozen_string_literal: true

Rails.application.routes.draw do
  mount RootApi => '/'
  post :toggle, to: 'locales#toggle'
  namespace :admin do
    root 'users#index'
    resources :users do
      member do
        post :toggle, action: :toggle
      end
    end
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
