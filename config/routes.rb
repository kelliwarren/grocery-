Grocery::Application.routes.draw do
  root to: "users#index"
  resources :users do
    get '/orders' => 'orders#index'
  end
  resources :stores do
    get '/orders' => 'orders#index'
  end
  devise_for :users
  resources :stores, only: [:show]
  resources :users do
    resources :stores do
      resources :products
    end
  end
end
