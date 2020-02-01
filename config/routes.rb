Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :users
  devise_for :users, :controllers => {
 :registrations => 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demands#index' #deviseでログインした後のページへ飛ぶ

  resources :demands do
    collection do
      post :confirm
    end
  end
  
  resources :supplies do
    collection do
      post :confirm
    end
  end

  resources :users 

  resources :favorite_demands
  resources :favorite_supplies

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
