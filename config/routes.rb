Rails.application.routes.draw do

  resources :invoices
  resources :purchases
  resources :products
  resources :payments
  root 'home#index'
  devise_for :users
  match '/add_to_shopping_cart', to: 'products#add_to_shopping_cart', via: 'post'
  match '/pay_with_spei', to: 'purchases#pay_with_spei', via: 'post'
  match '/pay_per_window', to: 'purchases#pay_per_window', via: 'post'
  mount ActionCable.server, at: '/cable'
end
