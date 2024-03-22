Rails.application.routes.draw do
  devise_for :users
  get '/auth/spotify/callback', to: 'users#spotify'
  get '/users/:id', to: 'users#show', as: 'user_profile'
  root to: "pages#home"

  get '/search', to: 'pages#search', as: 'search'
  resources :artists, only: :show do
    resources :reviews, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :reviews, except: [:create] do
    resources :likes, only: [:create]
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
  resources :likes, only: [:destroy]


  resources :followings, only: [:create, :destroy]
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
