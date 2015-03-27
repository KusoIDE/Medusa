Rails.application.routes.draw do

  devise_for :users
  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :packages, only: [:index, :create] do
        collection do
          get '/:package_name',    to: 'packages#show', as: :package
          put '/:package_name',    to: 'packages#update'
          delete '/:package_name', to: 'packages#destroy'

        end
      end
      get '/packages/archive-contents' => 'packages#archive_contents'
    end
  end

  get '/packages/archive-contents' => 'api/v1/packages#archive_contents'
  root :to => 'site#index'

end
