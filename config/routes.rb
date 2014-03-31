Grocery::Application.routes.draw do

  root to: "users#index"

  post 'add_to_cart/:id' => 'application#add_to_cart', as: 'add_to_cart'

  resources :checkout

  resources :users do
    resources :orders
  end

  get 'stores/:id' => 'stores#show'
  get '' => 'stores#edit'

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
