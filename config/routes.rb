Rails.application.routes.draw do
  devise_for :users
  get '/auth/spotify/callback', to: 'users#spotify'
  root to: "pages#home"

  get '/search', to: 'pages#search', as: 'search'
  resources :artists, only: :show do
    resources :reviews, only: [:create]
  end

  resources :albums, only: :show  do
    resources :reviews, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :tracks, only: :show  do
    resources :reviews, only: [:create]
  end

  resources :favorites, only: [:destroy]


  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
<<<<<<< HEAD
=======
  resources :albums do
    resources :reviews, only: [:create, :show, :edit, :update, :destroy]
  end
  resources :feed, only: [:index]
>>>>>>> 3f24e986f8f5f237c6a0c860a6e2a174b4a46af6

end
