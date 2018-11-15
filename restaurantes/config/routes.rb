Rails.application.routes.draw do
  resources :pratos
  resources :restaurantes
  resources :clients
  resources :ceps, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
