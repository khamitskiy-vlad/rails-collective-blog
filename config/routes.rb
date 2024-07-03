# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  shallow do
    resources :categories, param: :route, only: :show do
      resources :posts, except: %i[index show new create]
    end
  end

  resources :posts, only: %i[new create show] do
    scope module: :posts do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create destroy]
    end
  end

  devise_for :users

  get '/users/:id', to: 'users#show', as: 'user'
end
