NvpAa::Application.routes.draw do

  resources :news

  resources :jobs

  resources :carts
  match '/cart/charge' => 'carts#charge', as: :cart_charge
  match '/cart' => 'carts#index', as: :cart
  match '/cart/finalize' => 'carts#finalize', as: :cart_finalize
  match '/add_to_cart' => 'line_items#create', as: :add_to_cart
  match '/remove_from_cart' => 'line_items#destroy', as: :remove_from_cart
  resources :users do
    member do
      get 'edit'
      post 'update'
      get 'edit_payment'
      post 'update_payment'
    end
  end
  
  resources :user_sessions

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  resources :locations

  resources :onsite_lessons

  resources :online_lessons

  resources :instructors

  resources :onsite_courses

  resources :online_courses

  resources :market_sectors

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  match "/pages/*id" => 'pages#show', :as => :page, :format => false
  root to: 'pages#show', id: 'index'
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
  # match ':controller(/:action(/:id))(.:format)'
end
