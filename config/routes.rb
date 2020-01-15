Rails.application.routes.draw do
  devise_for :users
  root    'posts#index'
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'
end
