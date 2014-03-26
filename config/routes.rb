Grocery::Application.routes.draw do
  devise_for :users
  resources :stores, only: [:show]
  resources :users do
    resources :stores do
      resources :products
    end
  end
end
