Rails.application.routes.draw do
  resources :patients
  resources :appointments do
    collection do
      get "calendar", to: "appointments#index_for_calendar"
    end
  end
  devise_for :users
  root to: "home#index"
end
