Rails.application.routes.draw do
  root to: "talks#index"
  resources :talks do
    collection do
      post :confirm
    end
    resources :comments
  end
  resources :categories
end