Rails.application.routes.draw do
  devise_for :users
  root 'pages#main'

  get 'pages/reviews'
  post 'pages/reviews', to: 'pages#new_review'
  delete 'pages/destroy/:id', to: 'pages#destroy', as: 'destroy_review'
  get 'profile/update', to: 'profile#update'
  post 'profile/update', to: 'profile#edit'
  get 'unit/index', to: 'unit#index'
  get 'unit/new', to: 'unit#new'
  post 'unit/new', to: 'unit#create'
  get 'unit/show/:id', to: 'unit#show', as: 'unit_show'
  get 'unit/edit/:id', to: 'unit#edit', as: 'unit_edit'
  post 'unit/edit/:id', to: 'unit#update'
  delete 'unit/destroy/:id', to: 'unit#destroy', as: 'unit_destroy'
  get 'contacts/', to: 'pages#contacts'
  get 'teachers/', to: 'pages#teachers'
  get 'story/', to: 'pages#story'
  get 'administration/', to: 'pages#administration'
  get 'news/', to: 'pages#news'
end
