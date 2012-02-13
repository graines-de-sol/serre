Refuge::Application.routes.draw do


  devise_for :users

  root :to=> "dashboard#index"
  match 'login' => 'login#index'
end

