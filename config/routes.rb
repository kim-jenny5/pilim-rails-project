Rails.application.routes.draw do
  #homepage
  root "application#home"

  #signup
  get "/signup", to: "users#new"
  # post "/signup", to: "users#create" | not necessary due to resources :users?

  #login
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  #logout
  post "/logout", to: "sessions#destroy"

  resources :users
  resources :reviews
  resources :movies
  resources :lists
  resources :sessions

  get "/auth/google_oauth2/callback", to: "sessions#google_omniauth"
  get "/auth/facebook/callback", to: "sessions#facebook_omniauth"
end
