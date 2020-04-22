Rails.application.routes.draw do
  root "products#index"
  resources :products
  resources :check, only: [:index]
  resources :profile, only: [:index]
  resources :mypage, only: [:index]
  resources :credit, only: [:index]
  resources :confirm, only: [:index]
  resources :productiondetail, only: [:index]
  resources :logout, only: [:index]
end
