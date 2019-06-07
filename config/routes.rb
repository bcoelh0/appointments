Rails.application.routes.draw do
  resources :patients
  resources :appointments
  devise_for :users
  root to: "home#index"
end
