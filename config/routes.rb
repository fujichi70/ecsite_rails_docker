Rails.application.routes.draw do
  root 'shops#index'

  namespace :admins do
    get 'manage', to: 'manages#index'
    resources :products
    resources :readers, only:[:index, :show]
    resources :orders, only:[:index, :show, :edit]
  end
  
  namespace :users do
    get 'shop', to: 'shops#index'
  end

  resources :carts

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
    
  }
  
end
