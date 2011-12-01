Loccasions::Application.routes.draw do

  devise_for :users
  resources :events do
    resources :occasions
  end
  get 'events' => 'events#index', :as => :user_root
  root :to => "home#index"
 end
