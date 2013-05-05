DpjReflection2013::Application.routes.draw do

  controller :helps do
    get :introduction
  end

  resources :speaks, except: :destroy
  resources :users, only: :show
  resource  :user, except: [:new, :destroy]

  resource :session, only: [:new, :create, :destroy]
  match "sessions/destroy"

  namespace :admin do
    resources :users
  end

  root to: "speaks#index"
end
