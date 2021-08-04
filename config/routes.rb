Rails.application.routes.draw do
  get "/signup", to: "users#new"
  # post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :users
  resources :reviews
  resources :movies
  resources :lists
  resources :sessions
end
