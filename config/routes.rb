Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "my_bookings", to: "pages#my_bookings"

  resources :animals, only: %i[index show new create edit update destroy] do
    resources :bookings, only: %i[new create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
