Rails.application.routes.draw do
  get 'pages/splash'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#splash'
  get '/categories', to: 'categories#index', as: 'categories'
  resources :categories do
    resources :payments
  end
  
end
