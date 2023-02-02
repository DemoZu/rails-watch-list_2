# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:new, :create, :delete]
  end
  get 'lists', to: 'lists#index'
  get 'lists/:id', to: 'lists#show'
  get 'lists/new', to: 'lists#new'
  post 'lists', to: 'lists#create'
  root to: 'lists#index'
end
