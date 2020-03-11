Rails.application.routes.draw do
  root "posts#index"
  resources :sellcontents, only: [:index]
  resources :productiondetail, only: [:index]
end
