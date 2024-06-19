# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  resources :categories
  devise_for :users

  root 'home#index'

  get '/users/:id', to: 'users#show', as: 'user'
end
