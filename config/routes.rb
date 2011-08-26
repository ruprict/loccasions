Loccasions::Application.routes.draw do
  devise_for :users
  match 'events' => 'home#index', :as => :events
  root :to => "home#index"
 end
