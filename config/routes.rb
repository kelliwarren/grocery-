Grocery::Application.routes.draw do

  root to: "users#index"

  resources :users do
    resources :orders
  end

  resources :stores do
    get '/orders' => 'orders#index'
    delete '/orders/:id' => 'orders#destroy'
  end

  get '/orders/:id' => 'orders#show', as: "order"

  devise_for :users
  resources :stores, only: [:show]
  resources :users do
    resources :stores do
      resources :products
    end
  end
end
