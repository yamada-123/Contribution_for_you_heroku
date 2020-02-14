Rails.application.routes.draw do
  get 'comment_supplies/create'
  get 'comment_demands/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :users
#   devise_for :users, :controllers => {
#  :registrations => 'users/registrations'
# }
devise_for :users, :controllers => {
  :registrations => 'registrations'
 }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demands#index' #deviseでログインした後のページへ飛ぶ

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
