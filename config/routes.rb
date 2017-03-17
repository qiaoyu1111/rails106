Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    member do
      post 'upvote'
      post 'devote'
    end
  end
  root 'groups#index'
end
