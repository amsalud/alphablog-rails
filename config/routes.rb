Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  # Articles Routes
  resources :articles
  # Signup Routes
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  #Login Routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # Category Routes
  resources :categories
end
