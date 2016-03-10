Rails.application.routes.draw do
  #require 'sidekiq/web'
  #mount Sidekiq::Web, at: '/sidekiq'
  root to: 'locations#index'

  resources :locations, only: [:index, :show]

  devise_for :users

  namespace :admin do
    resources :locations
    resources :notifications
    resources :users
    resources :devices

    root to: "locations#index"
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :devices, only: [:index]
      resources :notifications, only: [:index]
    end
  end

end
