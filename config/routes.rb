Ludomanager2::Application.routes.draw do
  resources :people do
    resources :games
  end

  resources :editors do
    resources :games
  end


  resources :games do
    collection do
      get 'cat/:target' => "games#index", :as => "target"
      get 'time/:time' => "games#index", :as => "time"
      get 'cat/:target/time/:time' => "games#index", :as => "target_time"
    end
    member do
      get 'edit/:kind' =>  "games#edit", as: "kind_edit"
      post 'link/extensions' => "games#link_extensions", as: "link_extensions"
      put  'unlink/extensions/:extension_id' => "games#unlink_extensions", as: "unlink_extensions"
    end
    resources :editions, only: [:create, :update, :destroy, :edit] do
      member do
        put 'make_active' => "editions#make", as: "make_active"
      end
    end
  end


  root :to => 'games#index'


  namespace :admin  do
    root :to => "games#index"
    resources :games
    resources :countries
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
