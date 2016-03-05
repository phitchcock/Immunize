Rails.application.routes.draw do

  root 'locations#index'

  devise_for :users

  resources :locations
  resources :notifications, only: [:index, :new, :create]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :devices, only: [:index]
      resources :notifications, only: [:index]
    end
  end

end
