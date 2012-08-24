Refuge::Application.routes.draw do

  devise_for :users

  root :to=> "blog#index"

  match 'members/search' => 'members#search', :via => :post
  match 'members/mail' => 'members#mail_member', :via => :post
  match 'blog/category/:id' => 'blog#show_category',          :as => :blog_category, :via => :get
  match 'blog/archives/:year/:month' => 'blog#show_archives', :as => :blog_archives, :via => :get

  resources :blog
  resources :images,   :only => [:index, :create, :destroy]
  resources :surveys,  :only => [:create]
  resources :comments, :only => [:destroy]
  resources :ads,      :only => [:index, :create, :destroy]
  resources :members
  resources :pages
  resources :dashboard
  resources :events,   :only => [:index, :create]

  match 'medias/download/:id' => 'medias#download', :as => :media_download, :via => :get
  resources :medias, :only => [:index, :show, :create]

  namespace :admin do

    match 'occupation' => 'locations#occupation', :via=>:put

    resources :galleries,       :only => [:index, :create, :destroy]
    resources :events,          :only => [:update]
    resources :conf,            :only => [:index, :create]
    resources :headlines,       :only => [:index, :create]
    resources :stats,           :only => [:index]
    resources :locations,       :only => [:index, :create, :update, :destroy]
    resources :blog_categories, :only => [:index, :create, :update, :destroy]
    resources :ads,             :only => [:index, :create, :update, :destroy]
    resources :newsletters

    match 'medias/media/:id' => 'medias#delete_media', :as => :delete_media, :via => :delete
    resources :medias,     :only => [:index, :create, :update, :destroy] do
      member do
        post :upload_media
      end
    end

    resources :surveys,    :only => [:index, :create, :update, :destroy] do
      member do
        post   :create_answer
        delete :delete_answer
      end
    end

  end

  namespace :api do
    match 'blog/feed' => 'blog#feed', :as => 'rss_feed'

  end

  namespace :iframes do
    match 'members/search' => 'members#search', :via => :post, :as => 'members_search'
    resources :members, :only => [:index, :show]
  end
end

