Grocery::Application.routes.draw do
  get "users/index"
  devise_for :users
  resources :users do
    resources :stores
  end
end
