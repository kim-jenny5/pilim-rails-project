Rails.application.routes.draw do
  get "/signup", to: "users#new"

  resources :reviews
  resources :movies
  resources :lists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
