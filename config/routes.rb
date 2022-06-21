# frozen_string_literal: true

require 'resque/server'

Rails.application.routes.draw do
  devise_for :users
  mount RootApi => '/'
  mount Resque::Server.new, at: '/resque'
  post :toggle, to: 'locales#toggle'
  ActiveAdmin.routes(self)
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
