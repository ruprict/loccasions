Loccasions::Application.routes.draw do

  devise_for :users
  match 'events' => 'events#index', :as => :events
  root :to => "home#index"
 end
