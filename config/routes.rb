Rails.application.routes.draw do
  resources :records do
    resources :comments
    collection do
      post :confirm
    end
  end
  resources :users, only:[:index, :new, :create, :show, :update, :edit]
  resources :sessions, only:[:new, :create, :destroy]
  resources :favorites, only:[:create, :destroy, :index]
  resources :relationships, only:[:create, :destroy]
  resources :conversations do
    resources :messages
  end
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  root to: 'records#index'
end
