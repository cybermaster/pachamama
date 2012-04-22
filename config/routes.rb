Pacha2::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
<<<<<<< HEAD
  devise_for :admins
=======

  # the path_names use to change the default sign_up to register
  # devise_for :users, :path_names => { :sign_up => "register"}
>>>>>>> stag
  devise_for :users
  resources :roles
  resources :dining_tables
  resources :guests
  resources :events
  resources :users#, :only => :show

  devise_scope :users do
    put "/users" => "users#update"
    get "/edit/user" => "users#edit", :as => :edit_user_registeration
    put "/assets" => "dining_tables#set_table_leader"

  end

end
