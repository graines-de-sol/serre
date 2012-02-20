Refuge::Application.routes.draw do


  devise_for :users

  root :to=> "dashboard#index"

  resources :dashboard, :only=>'index'
  resources :messages, :only=>'index'
  resources :accounts, :only=>'index'
  resources :members
end

