Rails.application.routes.draw do

  root 'locations#index'

  devise_for :users

  namespace :admin do
    resources :users
    resources :devices
    resources :locations
    resources :notifications

    root to: "users#index"
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :devices, only: [:index]
      resources :notifications, only: [:index]
    end
  end

end
