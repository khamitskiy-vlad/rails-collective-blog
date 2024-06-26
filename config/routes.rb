# frozen_string_literal: true

Rails.application.routes.draw do
  shallow do
    resources :categories, param: :route, only: :show do
      resources :posts, except: %i[index show new create]
    end
  end

  resources :posts, only: %i[new create show]

  devise_for :users

  root 'home#index'

  get '/users/:id', to: 'users#show', as: 'user'
end
