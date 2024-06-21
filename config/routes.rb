# frozen_string_literal: true

Rails.application.routes.draw do
  shallow do
    resources :categories, param: :route, only: :show do
      resources :posts, except: [:index, :show, :new, :create]
    end
  end

  resources :posts, only: [:new, :create, :show]

  devise_for :users

  root 'home#index'

  get '/users/:id', to: 'users#show', as: 'user'
end
