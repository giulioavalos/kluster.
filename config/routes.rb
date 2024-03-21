Rails.application.routes.draw do
  devise_for :users
  get '/auth/spotify/callback', to: 'users#spotify'
  root to: "pages#home"

  # Routes for searching
  get '/search', to: 'pages#search', as: 'search'

  resources :artists, only: :show do
    resources :reviews, only: [:create]
  end

  resources :albums, only: :show  do
    resources :reviews, only: [:create]
  end

  resources :tracks, only: :show  do
    resources :reviews, only: [:create]
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

end
