Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  root to: "talks#index"
  resources :talks do
    collection do
      post :confirm
    end
    resources :comments
  end
  resources :profiles
  resources :categories
end