# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    devise_for :users
    resources :posts
    resources :categories
    resources :users
    resources :comments
    resources :tags
    resources :image_files, only: [:create, :destroy]
    get '/dashboard', to: 'static_pages#dashboard'
    root 'static_pages#dashboard'
  end

  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get '/service-worker.js', to: 'pwa#service_worker'
  get '/manifest.json', to: 'pwa#manifest'
  get '/:category_id', to: 'static_pages#show_category'
  resources :posts do
    member do
      patch 'toggle_like'
    end
    collection do
      post :preview
    end
  end
  resources :tags

  match '*unmatched_route', to: 'application#raise_not_found', via: :all
end
