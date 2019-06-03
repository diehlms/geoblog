Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :articles
  resources :sessions
  resources :users
  resources :comments

  get '/articles', to: 'articles#index'
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/geologyarticles', to: 'articles#geologyarticles'
  get '/musicarticles', to: 'articles#musicarticles'
end
