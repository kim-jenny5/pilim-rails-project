Rails.application.routes.draw do
  #homepage
  root "application#home"

  #signup
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  #login
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  #logout
  post "/logout", to: "sessions#destroy"

  resources :users, only: [:show, :edit, :update] do
    resources :reviews, only: :index
  end

  resources :movies, except: [:edit, :update, :destroy] do
    resources :reviews, only: [:new, :create, :index]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  resources :lists do
    resources :movies, only: [:add_movie, :delete_movie] do 
      post "add_movie", to: "lists#add_movie", as: "add"
      delete "delete_movie", to: "lists#delete_movie", as: "delete"
    end
  end

  #omniauths
  get "/auth/google_oauth2/callback", to: "sessions#google_omniauth"
  get "/auth/facebook/callback", to: "sessions#facebook_omniauth"
end
