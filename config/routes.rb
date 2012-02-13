Refuge::Application.routes.draw do


  devise_for :users

  root :to=> "dashboard#index"

  resources :dashboard
  resources :messages
  resources :accounts
  resources :members
end

