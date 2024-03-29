Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # routes for flats
  resources :flats, only: [:index, :new, :create, :show, :edit, :update] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create, :index]
  end

  resources :users, only: [:show, :edit]
  get '/profile', to: 'users#profile', as: 'profile'
  put '/users/:id', to: 'users#update', as: 'user_update'
  get '/dashboard', to: 'flats#dashboard', as: 'flat_dashboard'
  delete '/flats/:id', to: 'flats#destroy', as: 'flat_delete'

  # Route for showing all reviews
  get '/reviews', to: 'reviews#index', as: 'reviews'
end
