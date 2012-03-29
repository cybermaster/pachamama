Pacha2::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :admins
  devise_for :users
  resources :users, :only => :show
end
