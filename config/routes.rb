Grocery::Application.routes.draw do
  root to: "users#index"
  resources :users do
    resources :orders
  end
  resources :stores do
    resources :orders
  end
  devise_for :users
  resources :stores, only: [:show]
  resources :users do
    resources :stores do
      resources :products
    end
  end
end
