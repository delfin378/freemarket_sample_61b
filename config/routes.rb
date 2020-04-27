Rails.application.routes.draw do
  devise_for :users
  resources :registrations do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      post 'step5' #登録完了後
    end
  end
  root "posts#index"
  resources :sellcontents, only: [:index]
  root "products#index"
  resources :products
  resources :check, only: [:index]
  resources :profile, only: [:index]
  resources :mypage, only: [:index]
  resources :credit, only: [:index]
  resources :confirm, only: [:index]
  resources :productiondetail, only: [:index]
  resources :logout, only: [:index]
  resources :registrations, only: [:new, :index, :create]
end
