Rails.application.routes.draw do

  root to: 'pages#home'

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
