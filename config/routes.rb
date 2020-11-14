# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    root 'posts#index'
    devise_for :users
    resources :posts
    resources :categories
    resources :users
    resources :tags, only: [:index]
    resources :image_files, only: [:create, :destroy]
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
      get :search
    end
  end
  resources :tags, only: [:show]

  match '*unmatched_route', to: 'application#raise_not_found', via: :all
end
