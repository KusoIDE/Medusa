Rails.application.routes.draw do

  use_doorkeeper
  get 'packages/index'

  get 'packages/archive_contents'

  get '/packages/index' => 'packages#index'
  get '/packages/archive-contents' => 'packages#archive_content'
end
