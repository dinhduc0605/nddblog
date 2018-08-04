Rails.application.routes.draw do
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
  get 'techniques', to: 'static_pages#techniques'
  get 'life_stories', to: 'static_pages#life_stories'
  get 'japan', to: 'static_pages#japan'
  get 'about', to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
