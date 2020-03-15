Rails.application.routes.draw do
  root "posts#index"
  resources :sellcontents, only: [:index]
  resources :check, only: [:index]
  resources :profile, only: [:index]
  resources :mypage, only: [:index]
  resources :credit, only: [:index]
  resources :confirm, only: [:index]
end
