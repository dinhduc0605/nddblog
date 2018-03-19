Rails.application.routes.draw do
  namespace :admin do
    resources :posts
    resources :users
    resources :comments
    resources :tags
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
