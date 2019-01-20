Rails.application.routes.draw do

  root 'basic_pages#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  get '/create_post', to: 'posts#new'
  post '/create_post', to: 'posts#create'
  get '/all_posts', to: 'posts#index'
end
