Rails.application.routes.draw do
  # devise
  devise_for :users, controllers: {
    registrations: 'users/registrations'
   }
  # root
  root to: "talks#index"
  # talk / comments
  resources :talks do
    collection do
      post :confirm
    end
    resources :comments
  end
  # profile
  resources :profiles do
    member do
      get :talks
      get :comments
    end
  end
  # category
  resources :categories
  resources :likes, only: [:create, :destroy]
end