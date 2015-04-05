Rails.application.routes.draw do

  resources :github_events, :only => [ :index, :show ]

  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'

  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout

  root to: 'pages#home'
end
