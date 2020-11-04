Rails.application.routes.draw do
  resources :records do
    collection do
      post :confirm
    end
  end
  resources :users, only:[:new, :create, :show]
  resources :sessions, only:[:new, :create, :destroy]
end
