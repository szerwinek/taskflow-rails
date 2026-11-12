Rails.application.routes.draw do
  root "dashboard#show"

  get    "/signup",  to: "users#new"
  post   "/signup",  to: "users#create"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resource :dashboard, only: :show
  resources :projects do
    resources :tasks
  end
end
