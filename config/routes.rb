Rails.application.routes.draw do

  post 'sessions' => 'sessions#create'
  delete 'sessions/(:id)' => 'sessions#destroy'

  root 'users#index'
  get 'users/:id/edit' => 'users#edit'
  post 'users' => 'users#create'
  
  get 'events' => 'events#index'
  get 'events/:id' => 'events#show'
  post 'events' => 'events#create'
  get 'events/:id/edit' => 'events#edit'
  patch 'events/:id' => 'events#update'
  delete 'events/:id' => 'events#destroy'

  post 'joins/:id' => 'events#create'
  delete 'joins/:id' => 'events#destroy'

  post 'comments' => 'comments#create'
end