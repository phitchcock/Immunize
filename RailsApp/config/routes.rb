Rails.application.routes.draw do

  root to: 'pages#home'

  resources :locations, only: [:index, :show]

  devise_for :users

  namespace :admin do
    resources :locations
    resources :notifications
    resources :devices
    resources :users

    root to: "locations#index"
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :devices, only: [:index, :create]
      resources :notifications, only: [:index]
    end
  end

end
