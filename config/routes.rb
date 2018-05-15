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
  resources :circles, only: [:create, :destroy]

  resources :shares, only: [:create]

  authenticated :user do
    root to: "shares#index", as: :shares_index
  end
  

  root to: "home#index"

end
