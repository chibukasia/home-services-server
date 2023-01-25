Rails.application.routes.draw do
  resources :professions
  resources :terms_and_conditions
  resources :user_contracts
  resources :unlocks
  resources :appointment_orders
  resources :user_services
  resources :incidents
  resources :reviews
  resources :services
  resources :notifications
  resources :profiles
  resources :users

  post '/login', to: 'sessions#create'
  get '/logged_user', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'
  get '/current_user_services', to: 'user_services#current_user_services'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
