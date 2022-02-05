Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create]

  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
