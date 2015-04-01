Rails.application.routes.draw do

  devise_for :users
  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :packages, constraints: { id: /[a-zA-Z0-9_-]+/ }
      get '/packages/archive-contents' => 'packages#archive_contents'
    end
  end

  get '/packages/archive-contents', to: 'api/v1/packages#archive_contents'
  root 'site#index'
  get '/packages', to: 'site#packages'
  # route package ro mikhaim pagesh amadas roo controller id migire send mikone be view bade find kardan

end
