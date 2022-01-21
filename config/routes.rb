Rails.application.routes.draw do
  devise_for :users
  root 'pages#main'

  get 'pages/reviews'
  post 'pages/reviews', to: 'pages#new_review'
end
