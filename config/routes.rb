Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/sellcontents'
  root "posts#index"
end
