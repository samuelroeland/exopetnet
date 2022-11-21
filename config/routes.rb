Rails.application.routes.draw do
  devise_for :users, path:'users'
  root to: "pages#home"
  resources :users do
    resources :animals, only: %i[new create edit update destroy]
  end
  resources :animals, only: %i[index show]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
