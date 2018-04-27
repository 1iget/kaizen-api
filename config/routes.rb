# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :orders
  # RESTful routes
  # resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update destroy]
  # resources :clients, only: %i[index show update]
  # resources :clients
  resources :items

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  delete '/delete' => 'users#destroy'
  # Clients user routes
  post '/clients/sign-up' => 'clients#signup'
  post '/clients/sign-in' => 'clients#signin'
  delete '/clients/sign-out' => 'clients#signout'
  patch '/clients/change-password' => 'clients#changepw'
end
