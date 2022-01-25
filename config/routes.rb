Rails.application.routes.draw do
  devise_for :users
  root 'pages#main'

  get 'pages/reviews'
  post 'pages/reviews', to: 'pages#new_review'
  get 'profile/update', to: 'profile#update'
  post 'profile/update', to: 'profile#edit'
  get 'unit/index', to: 'unit#index'
  get 'unit/new', to: 'unit#new'
  post 'unit/new', to: 'unit#create'
end
