Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # routes for flats
  resources :flats, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show, :edit]
end
