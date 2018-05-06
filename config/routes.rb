Rails.application.routes.draw do

  get '/help', to: 'home#help'

  get '/about', to: 'home#about'

  get '/contact', to: 'home#contact'
  #reroute devise routes
  devise_for :users
  #resources for viewing users and posts, seperate from devise functionality
  resources :users

  #resources for posts
  resources :posts



  root to: "home#index"

end
