Crossroad::Application.routes.draw do
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

  resources :categories
  resources :articles
  resources :projects
  resources :events
  resources :places

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

  namespace :api do
    match '/type_list', :action => "type_list", :via => [:get, :post, :options], :format => "json"
    match '/new_type', :action => "new_type", :via => [:get, :post, :options], :format => "json"
    #match '/check_manager_authorization', :action => "check_manager_authorization", :via => [:get, :post, :options], :format => "json"
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'main#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  match "template", :controller => 'main', :action => 'template'
  match "category_template", :controller => 'main', :action => 'category_template'
  
  match "section/(:section)", :controller => 'main', :action => 'section', :as => :section
  match "make_new_one", :controller => 'main', :action => 'form', :as => :section, :as => :main_form

end
