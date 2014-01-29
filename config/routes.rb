Refuge::Application.routes.draw do

  devise_for :users

  root :to=> "dashboard#index", :id => 'last'

  match 'members/search' => 'members#search', :via => :post
  match 'members/mail' => 'members#mail_member', :via => :post
  match 'members/update_skills/:do' => 'members#update_skills', :via => :post
  match 'members/update_status/:do' => 'members#update_status', :via => :post
  match 'members/update_specificity/:do' => 'members#update_specificity', :via => :post
  match 'blog/category/:id' => 'blog#show_category',          :as => :blog_category, :via => :get
  match 'blog/archives/:year/:month' => 'blog#show_archives', :as => :blog_archives, :via => :get

  resources :blog
  resources :workgroups do
    member do
      get :files
      get :photos
      get :participants
      get :comments
      post :upload_file
      delete :delete_file
      post :upload_photo
      delete :delete_photo
      get :download
      get :comments
      post :create_comment
      delete :delete_comment
      post :notify_participants
    end
  end

  resources :galleries, :only => [:index, :show]
  resources :images,    :only => [:index, :create, :destroy]
  resources :surveys,   :only => [:create]
  resources :comments,  :only => [:destroy, :update]
  resources :ads,       :only => [:index, :create, :destroy]
  resources :members
  resources :pages
  resources :dashboard
  resources :events,   :only => [:index, :create, :show]
  resources :users,   :only => [:update]
  resources :search,   :only => [:create]

  match 'medias/download/:id' => 'medias#download', :as => :media_download, :via => :get
  resources :medias, :only => [:index, :show, :create]

  namespace :admin do

    match 'occupation' => 'locations#occupation', :via=>:put

    resources :galleries do
      resources :pictures, :only => [:create, :update, :destroy]
    end
    
    resources :blog
    resources :events,          :only => [:update]
    resources :conf,            :only => [:index, :create]
    resources :headlines,       :only => [:index, :create]
    resources :stats,           :only => [:index]
    resources :locations,       :only => [:index, :create, :update, :destroy]
    resources :blog_categories, :only => [:index, :create, :update, :destroy]
    resources :ads,             :only => [:index, :create, :update, :destroy]
    resources :newsletters
    resources :tags
    resources :workgroups do
      resources :contributors
      resources :materials
    end

    match 'medias/media/:id' => 'medias#delete_media', :as => :delete_media, :via => :delete
    resources :medias,     :only => [:index, :create, :update, :destroy] do
      member do
        post :upload_media
      end
    end

    match 'surveys/show_results/:id' => 'surveys#show_results', :via => :get
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

