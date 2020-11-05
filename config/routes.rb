Rails.application.routes.draw do
  resources :records do
    collection do
      post :confirm
    end
  end
  resources :users, only:[:new, :create, :show, :update, :edit]
  resources :sessions, only:[:new, :create, :destroy]
  resources :favorites, only:[:create, :destroy]
end
