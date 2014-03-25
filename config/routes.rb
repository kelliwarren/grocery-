Grocery::Application.routes.draw do
  devise_for :users
  resources :stores, only: [:show]
  resources :users do
    resources :stores
  end
end
