Rails.application.routes.draw do
  resources :customers
  root to: 'pages#home'
  get 'home', to: 'pages#home'
end
