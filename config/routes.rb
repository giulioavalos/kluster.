Rails.application.routes.draw do
  devise_for :users
  get '/auth/spotify/callback', to: 'users#spotify'
  get '/profile', to: 'users#profile'
  root to: "pages#home"

  get '/search', to: 'pages#search', as: 'search'
  resources :artists, only: :show do
    resources :reviews, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :albums, only: :show  do
    resources :reviews, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :tracks, only: :show  do
    resources :reviews, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :favorites, only: [:destroy]

  resources :followings, only: [:create, :destroy]
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
