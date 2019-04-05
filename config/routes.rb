Rails.application.routes.draw do

  root 'application#index'
  
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
      resources :purchase
    end
  end
end
