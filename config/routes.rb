Rails.application.routes.draw do

  root to: 'static_pages#home'

  # sessions
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # rides
  post "/rides/new", to: "rides#new"

  resources :users

  resources :attractions

end