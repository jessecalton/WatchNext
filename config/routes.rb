Rails.application.routes.draw do
  resources :users
  resources :movies

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
  root to:    'users#index'
end
