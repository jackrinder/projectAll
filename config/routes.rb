ProjectPage::Application.routes.draw do
  
  

  # matches the page localhost:3000/profile to the controller's action pages's profile.
  # It also gives a named route profile_path and profile_url. 
  # root uses a special syntax. It gives root_path  -> '/'. We must delete public/index.html also.
  
  # Always use named routes instead of hardcoded so that you can change the url in one place only
  
  resources :users
  resources :sessions, :only=>[:new, :create, :destroy]
  resources :microposts, :only=>[:create, :destroy]
  
  root :to=>'pages#home'
  
  # το named route για το /users/new ειναι users_new_path
  # αν θέλω να είναι στο url σκέτο localhost:3000/new_user
  # το αλλάζω απο εδώ
  # match "/new_user", :to=> 'users#new'
  match "/signin", :to=>'sessions#new'
  match '/signout', :to=>'sessions#destroy', :via=>:delete
  
  match "/sign_up", :to=>'users#new'
  match "/profile", :to=>'pages#profile'
  match "/cyprus_uni", :to=>'pages#cyprus_uni'
  match "/one_db_project", :to=>'pages#one_db_project'
  match "/photo_gallery", :to=>'pages#photo_gallery'
  match "/notepad", :to=>'pages#notepad'
  match "/about_us", :to=>'pages#about_us'
  match "/contact_us", :to=>'pages#contact_us'
  match "/demo", :to=>'pages#demo'
  
  
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
