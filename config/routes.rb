Rails.application.routes.draw do
  get 'comment_supplies/create'
  get 'comment_demands/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :users
  # devise_for :users, :controllers => {
  #   :registrations => 'users/registrations'
  # }

  devise_for :users, controllers: { 
    :confirmations =>'users/confirmations'
  }
  #devise_forはログインまわりに必要なルーティングを一気に生成してくれるdeviseのヘルパーメソッド。
  #devise_for :usersにより、「ログイン・新規登録」で必要なルーティングが生成される。
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'demands#index' #deviseでログインした後のページへ飛ぶ
  # root 'tops#index'
  root 'users#show(user.id)'

  resources :demands do
    resources :comment_demands
    collection do
      post :confirm
    end
  end
  
  resources :supplies do
    resources :comment_supplies
    collection do
      post :confirm
    end
  end

  resources:labels

  resources :users 

  resources :conversations do
    resources :messages
  end

  resources :labelling_demands,only: [:create, :destroy]
  resources :labelling_supplies,only: [:create, :destroy]

  resources :favorite_demands
  resources :favorite_supplies

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  

end
