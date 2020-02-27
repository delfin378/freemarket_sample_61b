Rails.application.routes.draw do
  root "credit#index"
  resources :sellcontents, only: [:new, :create]
end
