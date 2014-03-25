Grocery::Application.routes.draw do
  devise_for :users
  resources :users do
    resources :stores do
      resources :products
    end
  end
end
