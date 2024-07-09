# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  
  resources :categories, only: :show

  resources :posts, except: :index do
    scope module: :posts do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create destroy]
    end
  end

  devise_for :users

  get '/users/:id', to: 'users#show', as: 'user'
end
