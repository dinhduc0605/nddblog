# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    devise_for :users
    resources :posts
    resources :categories
    resources :users
    resources :comments
    resources :tags
    get '/dashboard', to: 'static_pages#dashboard'
    root 'static_pages#dashboard'
  end

  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get '/:category_id', to: 'static_pages#show_category'
  resources :posts
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
