Rails.application.routes.draw do
  root    'posts#index'
  devise_for :users
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    collection do
      get ":id/likes" => "users#likes", as: :likes
      get ":id/comments" => "users#comments", as: :comments
    end
  end
  devise_scope :user do
    get 'profile/:id/' => 'users/registrations#profile', as: 'profile'
    get 'profile/:id/following', to: 'users/registrations#following', as: 'following'
    get 'profile/:id/followers', to: 'users/registrations#followers', as: 'followers'
  end
  resources :relationships, only: [:create, :destroy]
end
