Leave::Application.routes.draw do





  resources :roles

  resources :admin, :only => [:index], :controller => :admin
  namespace :admin do   
  resources :employees do
   collection do
        get 'search'
        
      end   
  end
  resources :locations
  resources :leave_requests
  resources :leaves
controller :leave_requests do
    get 'request_leave' => :new
    get 'request_success' => :request_success
    get 'leave_request_search' =>:index
    get 'request_update' =>   :request_update
    get 'employee_leaves' =>   :index
    get 'applied_leaves' =>   :applied_leaves
    get 'leave_cancel' =>   :leave_cancel
    get 'leave_approve' =>   :leave_approve
    post 'leave_approve_update' =>   :leave_approve_update
    get 'commit_leave' =>   :commit_leave
    post 'leave_request_commit' =>   :leave_request_commit
    get 'forcedleave' =>   :forcedleave
    get 'addforcedleave' =>   :addforcedleave
    post 'addforcedleave' =>   :addforcedleave
  

    


  end

  resources :high_scores    
  end


# Front end Controllers
  resources :leaves
  resources :employees 
  resources :leave_requests
  get 'change_password' => 'sessions#change_password'
  post 'change_update' => 'sessions#change_update'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  controller :leave_requests do
    get 'request_leave' => :new
    get 'request_success' => :request_success
    get 'leave_request_search' =>:index
    get 'request_update' =>   :request_update
    get 'employee_leaves' =>   :employee_leaves
    get 'leave_cancel' =>   :leave_cancel
    get 'leave_approve' =>   :leave_approve
    post 'leave_approve_update' =>   :leave_approve_update


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
  root :to => 'sessions#new'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
