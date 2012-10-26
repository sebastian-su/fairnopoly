Fairnopoly::Application.routes.draw do
  mount Tinycms::Engine => "/cms"
  match "/*id" => 'tinycms/contents#not_found'
end

[Tinycms::Engine, Fairnopoly::Application].each do |app| 
  app.routes.draw do

  ActiveAdmin.routes(self)

  get "invitation/index"

  resources :categories
  resources :images
  resources :userevents
  resources :events
  resources :invitations
  resources :ffps
  #recources :user

  
  
  devise_for :user

  resources :auctions do
  #recources :userevents
    get :autocomplete_auction_title, :on => :collection
  end

  get "welcome/index"
  match "continue_creating_auction" => 'auctions#finalize'

  #the user routes
  match 'dashboard' => 'dashboard#index'
  match 'dashboard/search_users' => 'dashboard#search_users'
  match 'search_users' => 'dashboard#search_users'
  match 'dashboard/admin' => 'dashboard#admin'
  match 'dashboard/follow_user' => 'dashboard#follow_user'
  match 'dashboard/list_followers' => 'dashboard#list_followers'
  match 'dashboard/list_following' => 'dashboard#list_following'
  match 'community' => 'dashboard#community'
  #match 'autocomplete_user_name' => 'dashboard#autocomplete_user_name'
  #confirmation invitation
  match 'confirm_invitation' => 'invitations#confirm'

  match 'event' => 'userevents#index'
  match 'invitation' => 'invitations#new'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  

#root :to => 'dashboard#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
end