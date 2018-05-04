Rails.application.routes.draw do

  get '/help', to: 'static_pages#help'

  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'
  #reroute devise routes
  devise_for :users
  #resources for viewing users and posts, seperate from devise functionality
  resources :users

  #resources for posts
  resources :posts, only: [:index, :create, :destroy]



  root to: "static_pages#home"

end
