Pacha2::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  # the path_names use to change the default sign_up to register
  # devise_for :users, :path_names => { :sign_up => "register"}
  devise_for :users
  resources :roles
  resources :users#, :only => :show

  as :users do
    get "/new/edit" => "users#edit", :as => :edit_user_registeration
  end

end
