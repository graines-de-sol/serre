Refuge::Application.routes.draw do


  devise_for :users

  root :to=> "dashboard#index"

  resources :dashboard, :only=>'index'
  resources :accounts, :only=>'index'

  match '/members/search' => 'members#search', :via=>:post
  match '/members/mail' => 'members#mail_member', :via=>:post

  resources :members

end

