Rails.application.routes.draw do
  root "posts#index"
  resources :sellcontents, only: [:new, :create]
end
