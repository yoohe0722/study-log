Rails.application.routes.draw do
  devise_for :users
  root  'posts#index'
  get   'posts'       =>  'posts#index'
  get   'posts/new'   =>  'posts#new'
  post  'posts'       =>  'posts#create'
  get   'users/:id'   =>  'users#show'
end
