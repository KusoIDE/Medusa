Rails.application.routes.draw do

  get 'packages/index'

  get 'packages/archive_contents'

  get '/packages/index' => 'packages#index'
  get '/packages/archive-contents' => 'packages#archive_content'
end
