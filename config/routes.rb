Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  # get '/contests', to: 'contests#index'
  # get '/contests/new', to: 'contests#new', as: 'new_contest'
  # post '/contests', to: 'contests#create'
  # get '/contests/:id/edit', to: 'contests#edit', as: 'edit_contest'
  # patch '/contests/:id', to: 'contests#update'
  # get 'contests/:id', to: 'contests#show', as: 'contest'
  # delete 'contests/:id', to: 'contests#destroy'
  
  resources :contests do
    member do
      post 'like' 
    end
  end
  
  resources :visitors, except: [:new]
  
  get '/register', to: 'visitors#new'

end
