Forum::Application.routes.draw do


  

  root :to => "categories#index"



  
  
  scope "(:locale)", :locale => /en|de/ do
    devise_for :users
    resources :users
    resources :posts
    resources :freds , :except => [:new]
    resources :categories, :except => [:new]
    resource :posts, :except => [:new]
    match "users/:id" => "users#destroy", :as => :destroy_user, :via => :delete
    match "users/:flag/:id" => "users#show", :as => :show_user, :via => :get
    match "users/" => "users#index", :via => :get, :as => :show_users
    match "posts/:id/:post_or_thread/:reply_or_quote/new" => "posts#new", :as => :new_post, :via => :get
    match "categories/:id/new" => "categories#new", :as => :new_category, :via => :get
    match "freds/:id/new" => "freds#new", :as => :new_fred, :via => :get
  end


  


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
