Rails.application.routes.draw do
  get 'notifications/create'

  root 'locations#index'

  resources :locations
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :locations, only: [:index, :show]
    end
  end

end
