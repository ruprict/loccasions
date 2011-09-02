Loccasions::Application.routes.draw do

  devise_for :users
  resources :events
  get 'events' => 'events#index', :as => :user_root
  root :to => "home#index"
 end
