Rails.application.routes.draw do
  devise_for :users
  root    'posts#index'
  get     'posts'       =>  'posts#index'
  get     'posts/new'   =>  'posts#new'
  post    'posts'       =>  'posts#create'
  delete  'posts/:id'   =>  'posts#destroy'
  get     'posts/:id/edit'  => 'posts#edit'
  patch   'posts/:id'  => 'posts#update'
  get     'users/:id'   =>  'users#show'
end
