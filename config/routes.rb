Rails.application.routes.draw do
  devise_for :users
  get '/auth/spotify/callback', to: 'users#spotify'
  get '/users/:id', to: 'users#show', as: 'user_profile'
  post '/followings', to: 'followings#create', as: 'followings'
  delete 'followings/:id', to: 'followings#destroy', as: 'following'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update', as: 'update_user'
  patch 'users/:id', to: 'users#update'

  root to: "pages#home"

  get '/search', to: 'pages#search', as: 'search'
  resources :artists, only: :show do
    resources :reviews, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :reviews, except: [:create, :destroy] do
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


  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  get '*path', to: 'application#not_found'
end
