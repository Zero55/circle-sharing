Rails.application.routes.draw do

  get '/help', to: 'home#help'

  get '/about', to: 'home#about'

  get '/contact', to: 'home#contact'

  devise_for :users
  #resources for viewing users and posts, seperate from devise functionality
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts
  resources :relationships, only: [:create, :destroy]
  
  root to: "home#index"

end
