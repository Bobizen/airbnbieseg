Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # routes for flats
  resources :flats, only: [:new, :create, :show]
end
