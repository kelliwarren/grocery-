Grocery::Application.routes.draw do
  root to: "users#index"
  resources :users do
    resources :order
  end
  resources :stores do
    resources :order
  end
  devise_for :users
  resources :stores, only: [:show]
  resources :users do
    resources :stores do
      resources :products
    end
  end
end
