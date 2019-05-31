Rails.application.routes.draw do

  resources :purchases
  resources :products
  root 'home#index'
  devise_for :users
  match '/add_to_shopping_cart', to: 'products#add_to_shopping_cart', via: 'post'
end
