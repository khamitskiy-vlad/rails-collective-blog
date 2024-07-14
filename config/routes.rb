# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :categories, only: :show

  resources :posts, only: %i[show new edit create update destroy] do
    scope module: :posts do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create destroy]
    end
  end

  devise_for :users

  resources :users, only: :show
end
