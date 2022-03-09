Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      get 'forecast', to: 'forecast#index'
      get 'image', to: 'image#index'
      post 'road_trip', to: 'roadtrip#index'
    end
  end

end
