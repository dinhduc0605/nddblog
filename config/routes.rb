Rails.application.routes.draw do

  get 'posts/show'

  namespace :admin do
    devise_for :users
    resources :posts
    resources :users
    resources :comments
    resources :tags
    get '/dashboard', to: "static_pages#dashboard"
    root "static_pages#dashboard"
  end

  root 'static_pages#home'
  resources :posts
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
