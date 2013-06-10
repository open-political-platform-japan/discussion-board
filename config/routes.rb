DiscussionBoard::Application.routes.draw do

  controller :helps do
    get :introduction
  end

  resources :speaks, except: :destroy do
    post :vote, on: :member
  end

  resources :users, except: [:destroy]

  resource :session, only: [:new, :create, :destroy]
  match "sessions/destroy"

  namespace :admin do
    resources :users
    resource :configurable
    get "speaks/download_all"
  end

  root to: redirect("/speaks")
end
