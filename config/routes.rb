Rails.application.routes.draw do
  root 'static_pages#home'
# Static pages
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
# Users
  resources :users
  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
# Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
# Activations
  resources :account_activations, only: [:edit]
# Pssword reset
  resources :password_resets, only: [:new, :create, :edit, :update]
# Microposts
  resources :microposts, only: [:create, :destroy]
end
