Rails.application.routes.draw do

  devise_for :users
  use_doorkeeper
  get 'packages/index'

  get 'packages/archive_contents'

  get '/packages/index' => 'packages#index'
  get '/packages/archive-contents' => 'packages#archive_content'
end
