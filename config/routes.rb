Rails.application.routes.draw do
  devise_for :users
  get '/auth/spotify/callback', to: 'users#spotify'
  root to: "pages#home"

  resources :reviews, except: [:index, :new]
  resources :artists, only: [:index, :show]

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

  get '/artists', to: 'artists#index'
  get '/artists/:spotify_artist_id', to: 'artists#show'

  get '/albums', to: 'albums#index'
  get '/albums/:spotify_album_id', to: 'albums#show'

  post '/albums/:spotify_album_id/reviews', to: 'reviews#create'

end
