Rails.application.routes.draw do

  # resources :covers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      jsonapi_resources :books
      jsonapi_resources :users
      resources :token
      resources :covers
    end
  end
end
