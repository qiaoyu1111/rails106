Rails.application.routes.draw do
  resources :groups do
    member do
      post 'upvote'
      post 'devote'
    end
  end
  root 'groups#index'
end
