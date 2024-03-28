Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # routes for flats
  resources :flats, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create, :index]
  end
  
  resources :users, only: [:show, :edit]

  # Route for showing all reviews
  get '/reviews', to: 'reviews#index', as: 'reviews'
end
