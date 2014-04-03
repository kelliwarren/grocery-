Grocery::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  post '/line_items' => "line_items#create"

  post 'add_to_cart/:id' => 'application#add_to_cart', as: 'add_to_cart'

  post 'checkout' => 'orders#checkout'

  resources :users do
    resources :orders do
      resources :line_items
    end

  end

  get 'stores/:id' => 'stores#show'


  resources :stores do
    get '/orders' => 'orders#index'
    delete '/orders/:id' => 'orders#destroy'
  end

  get '/orders/:id' => 'orders#show', as: "order"

  resources :products
resources :stores do
      resources :products
    end
  resources :stores, only: [:show]
  resources :users do
    resources :stores
  end
end
