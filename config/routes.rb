Rails.application.routes.draw do
  get 'users/index'
  # devise
  devise_for :users, controllers: {
    registrations: 'users/registrations'
   }
   resources :users, only: [:index, :edit, :update, :destroy]
  # root
  root to: "talks#top"
  # talk / comments
  resources :talks do
    collection do
      get :top
    end
    collection do
      post :confirm
    end
    resources :comments
    resources :likes, only: [:create, :destroy]
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
end