# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, except: :index
  resources :categories, only: :show
  devise_for :users

  root 'home#index'

  get '/users/:id', to: 'users#show', as: 'user'
end
