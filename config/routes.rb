Rails.application.routes.draw do
  resources :orders
  resources :carts
  resources :products
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
