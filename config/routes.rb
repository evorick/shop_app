Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'storefront/index'

  resources :products
  resources :brands
  resources :categories
  root to: 'visitors#index'
  devise_for :users

  # root 'storefront#index'
end
