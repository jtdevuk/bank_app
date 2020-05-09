Rails.application.routes.draw do
  resources :customers
  root to: 'pages#home'
  get 'login', to: 'logins#new'
  get 'logout', to: 'logins#destroy'
  post 'login', to: 'logins#create'
  get 'home', to: 'pages#home'
end
