Rails.application.routes.draw do
  root    'posts#index'
  devise_for :users
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    collection do
      # get 'likes/:id' => 'users#likes', as: :likes
      get ":id/likes" => "users#likes", as: :likes
    end
  end
end
