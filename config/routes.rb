Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#geologyarticles'

  resources :articles
  resources :sessions
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :comments
  resources :password_resets


  get '/articles', to: 'articles#index'
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/geologyarticles', to: 'articles#geologyarticles'
  get '/musicarticles', to: 'articles#musicarticles'
end
