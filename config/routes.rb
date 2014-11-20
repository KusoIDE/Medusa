Rails.application.routes.draw do

  devise_for :users
  use_doorkeeper

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get '/packages/' => 'packages#index'
      get '/packages/archive-contents' => 'packages#archive_content'
    end
  end

end
