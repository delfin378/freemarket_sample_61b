Rails.application.routes.draw do
  devise_for :users
  resources :registrations do
    collection do
      get 'new' #会員情報入力
      get 'new_phone' #電話番号認証
      get 'new_address' #住所入力
      get 'new_credit' #クレジットカード追加
      post 'complete' #登録完了
    end
  end
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
