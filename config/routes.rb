Rails.application.routes.draw do
  devise_for :users
  get '/auth/spotify/callback', to: 'users#spotify'
  root to: "pages#home"

  resources :reviews, except: [:index, :new]
  resources :artists, only: [:index, :show]

  get '/search', to: 'pages#search', as: 'search'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
  resources :albums do
    resources :reviews, only: [:create, :show, :edit, :update, :destroy]
  end
end
