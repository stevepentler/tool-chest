Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do 
    resources :tools, only: [:index, :show]
  end

  namespace :admin do 
    resources :tools, except: [:show]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end
