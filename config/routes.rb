Rails.application.routes.draw do

  get '/help', to: 'static_pages#help'

  get '/about', to: 'static_pages#about'

  get '/contact', to: 'static_pages#contact'

  #resources for viewing users and posts, seperate from devise functionality
  resources :users, :controller => 'users'

  devise_for :users, :path => 'u'

  root to: "static_pages#home"

end
