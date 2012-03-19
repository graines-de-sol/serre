Refuge::Application.routes.draw do

  devise_for :users

  root :to=> "dashboard#index"

  match '/members/search' => 'members#search', :via=>:post
  match '/members/mail' => 'members#mail_member', :via=>:post
  match '/admin/conf' => 'admin#conf', :via=>:post
  match '/admin/categories/delete/:id' => 'admin#categories_delete', :via=>:delete
  match '/admin/categories/create' => 'admin#categories_create', :via=>:post
  match '/admin/categories/update' => 'admin#categories_update', :via=>:put
  match '/admin/locations/delete/:id' => 'admin#locations_delete', :via=>:delete
  match '/admin/locations/create' => 'admin#locations_create', :via=>:post
  match '/admin/locations/update' => 'admin#locations_update', :via=>:put
  match '/admin/surveys/create' => 'admin#surveys_create', :via=>:post
  match '/admin/surveys/update' => 'admin#surveys_update', :via=>:put
  match '/admin/answers/create/:id' => 'admin#answers_create', :via=>:post
  match '/admin/answers/delete/:id' => 'admin#answers_delete', :via=>:delete
  match '/admin/occupation' => 'admin#occupation', :via=>:put

  resources :members
  resources :pages
  resources :dashboard
  resources :admin, :only=>'show'
end

