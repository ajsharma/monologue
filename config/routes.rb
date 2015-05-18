Rails.application.routes.draw do

  resources :github_events, :only => [ :index, :show ]

  get '/auth/:provider/callback' => 'sessions#create', :as => :auth_create
  get '/auth/failure' => 'sessions#failure'

  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout

  get '/orgs' => 'orgs#index', :as => :orgs
  get '/:org/repos' => 'repos#index', :as => :repos
  get '/:org/:repo/issues(/:username)' => 'issues#index', :as => :issues
end
