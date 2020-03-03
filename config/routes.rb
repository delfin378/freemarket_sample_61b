Rails.application.routes.draw do
  root "posts#index"
  resources :sellcontents, only: [:new, :create]
  get 'sellcontents' => 'posts#sellcontents'
end
