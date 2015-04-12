Rails.application.routes.draw do

  resources :github_events, :only => [ :index, :show ]
  resources :repos, :only => [ :index ]

  get '/auth/:provider/callback' => 'sessions#create', :as => :auth_create
  get '/auth/failure' => 'sessions#failure'

  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout

  get '/:org/:repo/issues(/:username)' => 'issues#index', :as => :issues

  root to: 'repos#index'
end
