Grocery::Application.routes.draw do
  root to: "users#index"
  devise_for :users
  resources :stores, only: [:show]
  resources :users do
    resources :stores do
      resources :products
    end
  end
end
