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
  
  resources :users

  devise_for :users, path: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      jsonapi_resources :books
      jsonapi_resources :users
      resources :token
      resources :covers
      resources :purchase
    end
  end
end
