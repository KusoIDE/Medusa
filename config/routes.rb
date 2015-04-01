Rails.application.routes.draw do

  devise_for :users
  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :packages, constraints: { id: /[a-zA-Z0-9_-]+/ }
      get '/packages/archive-contents' => 'packages#archive_contents'
    end
  end

  get '/packages/archive-contents' => 'api/v1/packages#archive_contents'
  get '/packages' => 'site#packages'
  get '/packages/:id' => 'site#package_path'
  root 'site#index'
end
