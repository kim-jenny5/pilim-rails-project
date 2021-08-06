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

  resources :users do
    # resources :reviews, shallow: true, only: :index #users/1/reviews (located in review index)
    resources :reviews, only: :index #users/1/reviews (located in review index)
  end
  # resources :reviews
  resources :movies do
    # resources :reviews, shallow: true #movies/1/reviews (located in movie show view)
    resources :reviews, only: [:new, :create, :index] #movies/1/reviews (located in movie show view)
    # post "add_movie", as: "add"
    # delete "delete_movie", as: "delete"
  end

  resources :reviews, only: [:edit, :update, :destroy]

  resources :lists do
    resources :movies, only: [:post, :delete] do 
      post "add_movie", to: "lists#add_movie"
      delete "delete_movie", to: "lists#delete_movie"
    end
  end

  resources :sessions

  get "/auth/google_oauth2/callback", to: "sessions#google_omniauth"
  get "/auth/facebook/callback", to: "sessions#facebook_omniauth"
end
