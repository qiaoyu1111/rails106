Rails.application.routes.draw do
  devise_for :users

  resources :groups do
    resources :posts
  end

  resources :groups do
    member do
      post 'upvote'
      post 'devote'
      post :join
      post :quit
    end
  end

  root 'groups#index'

  namespace :acount do
    resources :groups
    resources :posts
  end
end
