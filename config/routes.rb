Rails.application.routes.draw do
  use_doorkeeper
  require 'sidekiq/web'

  root 'application#index'

  mount Sidekiq::Web => '/sidekiq'

  resources :books do
    member do
      get :delete
    end
  end

  resources :users
  get 'logout', to: 'sessions#destroy'
  resource :session, except: [:edit, :index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :books, only: [:index, :show]
      resources :users
      resource :cart
      resources :books_carts
      resources :token
      resources :covers
      resource :profile, only: [:show]
      # get 'profile', action: :profile, controller: 'sessions'
      # resources :purchase
      post 'purchase/create_order', to: 'purchase#create_order', as: :create_order
      post 'purchase/capture_order', to: 'purchase#capture_order', as: :capture_order
      get 'purchase', to: 'purchase#index'
    end
  end
end
