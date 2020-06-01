Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  resources :registrations do
    collection do
      get 'signup' #新規会員登録
      get 'new' #会員情報入力
      get 'new_phone' #電話番号認証
      get 'new_address' #住所入力
      get 'new_credit' #クレジットカード追加
      post 'complete' #登録完了
    end
  end
  root "products#index"
  resources :products do
    member do
      get 'purchase'
      post 'pay'
      post 'purchased'
      get 'purchased'
    end
  end
  resources :users, only: :show

  resources :check, only: [:index]
  resources :profile, only: [:index]
  resources :mypage, only: [:index]
  resources :credit, only: [:index]
  resources :confirm, only: [:index]
  resources :productiondetail, only: [:index]
  resources :logout, only: [:index]
  resources :login, only: [:index]
end
