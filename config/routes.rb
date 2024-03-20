Rails.application.routes.draw do
  devise_for :users
  get '/auth/spotify/callback', to: 'users#spotify'
  root to: "pages#home"

  # Routes for searching
  get '/search', to: 'pages#search', as: 'search'

  # Routes for artists
  resources :artists, only: [:index, :show]

  # Routes for albums with nested favorites and likes
  resources :albums do
    resource :favorite, only: [:create, :destroy]
    resource :like, only: [:create, :destroy]
    resources :reviews, only: [:create, :show, :edit, :update, :destroy]
  end

  # Routes for reviews with nested likes
  resources :reviews, except: [:index, :new] do
    resource :like, only: [:create, :destroy]
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
