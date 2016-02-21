Rails.application.routes.draw do
  resources :scores
  resources :alerts
  resources :paths
  resources :lines
  resources :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post 'facebook/callback'=> 'users#facebook'
  post 'user/login'=> 'users#login'

  root 'home#index'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      resource :country do
        get 'find/:letters', controller: 'country', action: :find_match
        post 'create', controller: 'country', action: :create
      end

      resource :state do
        get 'find/:country_id/:letters', controller: 'state', action: :find_match
        post 'create', controller: 'state', action: :create
      end

      resource :city do
        get 'find/:state_id/:letters', controller: 'city', action: :find_match
        post 'create', controller: 'city', action: :create
      end

      resource :line_search do
        get 'search', controller: 'line_search', action: :search
      end

      resource :user do
        get 'location/push/sensor', controller: 'user', action: :location_push
      end



      #TODO: Construct Routes 2 push GPS sensor data
      #TODO: Construct Routes 2 search LineInstances




    end
  end


  # post 'tools/generate_map_tool_routes/:id/point/new', controller: 'generate_map_tool_routes', action: :create_point
  # match 'tools/generate_map_tool_routes/:id/point/new.:idp', controller: 'generate_map_tool_routes', action: :delete_point, :via => "delete"
  #
  # patch 'flight_price_tables/table/update/:id', controller: 'flight_price_tables', action: :update
  # get  'flight_price_tables/table/show/:to', controller: 'flight_price_tables', action: :show_table

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
