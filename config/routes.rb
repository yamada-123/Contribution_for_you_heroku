Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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

end
