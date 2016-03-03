Rails.application.routes.draw do

  root 'locations#index'

  resources :locations
  resources :notifications, only: [:index, :new, :create]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :locations, only: [:index, :show]
    end
  end

end
