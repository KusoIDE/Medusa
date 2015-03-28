Rails.application.routes.draw do

  devise_for :users
  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :packages, constraints: { id: /[A-Z][A-Z][0-9][_-]+/ }
      get '/packages/archive-contents' => 'packages#archive_contents'
    end
  end

  get '/packages/archive-contents' => 'api/v1/packages#archive_contents'
  root :to => 'site#index'
  get '/packages' => 'site#packages'
end
