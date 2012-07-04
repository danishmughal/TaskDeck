Taskdeck::Application.routes.draw do

  resources :users
  resources :sessions, only: [:create, :new, :destroy] 
  resources :organizations 
  resources :teams
  resources :tasks

  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  match '/neworg', to: 'organizations#new'
  match '/join', to: 'organizations#join'
  match '/joinorg', to: 'organizations#joinorg'
  match '/teampanel', to: 'teams#teampanel'
  match '/newteam', to: 'teams#new'
  match '/orgpanel', to: 'organizations#orgpanel'
  match '/jointeam', to: 'users#jointeam'
  match '/confirmteam', to: 'users#confirmteam'
  match '/denyteam', to: 'users#denyteam'
  match '/removeuserteam', to: 'users#removeuserteam'
  match '/deleteteam', to: 'teams#deleteteam'
  match '/newtask', to: 'tasks#new'
  match '/team_management', to: 'teams#team_management'
  match '/member_tasks', to: 'teams#member_tasks'
  match '/approvetask', to: 'tasks#approvetask'
  match '/rejecttask', to: 'tasks#rejecttask'
  match '/completetask', to: 'tasks#completetask'
  match '/updatetask', to: 'tasks#updatetask'
  match '/finished', to: 'tasks#finished'
  match '/pending', to: 'tasks#pending'
  match '/update', to: 'tasks#updateform'

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
