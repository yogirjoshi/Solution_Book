SolutionBook::Application.routes.draw do
  get "set_topic/add_topic"

  get "set_topic/delete_topic"

  get "set_topic/show_topics"

  get "set_topic/view_topic"

  post "set_topic/view_topic"

  get "post/post_question"
  
  get "post/view_answer"
  
  post "post/post_question"

  get "post/post_answer"
  
  post "post/post_answer"

  get "post/rate_question"

  get "post/rate_answer"

  get "login/add_user"
  
  get "login/index" 
  
  get "login/error"

  get "login/login"

  get "login/logout"

  get "login/delete_user"

  get "login/list_users"
	
  post "login/add_user"
	
  post "login/login" 
  
  post "login/index" 
  
  post "set_topic/add_topic"

  post "set_topic/delete_topic"

  post "set_topic/show_topics"

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
