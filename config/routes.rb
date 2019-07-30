Rails.application.routes.draw do
  require 'sidekiq/web'

  root 'application#index'
  get 'transaction', to: 'application#transaction'
  
  mount Sidekiq::Web => '/sidekiq'

  resources :books do
    member do
      get :delete
    end
  end

  resources :users do
    member do
      get :delete
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      jsonapi_resources :books
      jsonapi_resources :users
      resources :token
      resources :covers
      # resources :purchase
      post 'purchase/create_order', to: 'purchase#create_order', as: :create_order
      post 'purchase/capture_order', to: 'purchase#capture_order', as: :capture_order
      get 'purchase', to: 'purchase#index'
    end
  end
end
