Rails.application.routes.draw do
  namespace :admin do
    devise_for :users
    resources :posts
    resources :users
    resources :comments
    resources :tags
    root to: "users#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
