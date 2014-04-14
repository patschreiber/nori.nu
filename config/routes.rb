Public::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  devise_scope :user do
    match '/inventory' => 'registrations#show', via: [:get, :post], :as => :inventory
    match '/profile' => 'users#show', via: [:get, :post], :as => :profile
    match '/signup' => 'registrations#new', via: 'get', :as => :signup
    match '/signin' => 'sessions#new', via: 'get'
    match '/signout' => 'sessions#destroy', via: 'delete'
  end
  #resources :sessions, only: [ :new, :create, :destroy ]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'pages#index'

  match '/about' => 'pages#about', via: 'get', :as => :about
  match '/help' => 'pages#help', via: 'get', :as => :help
  get '/guide' => 'pages#game_guide', :as => :game_guide

  match '/game' => 'game#index', via: [:get, :post], :as => :game
  match '/update-stats' => 'game#update_stats', via: [:put], :as => :update_stats
  match '/item-cranks' => 'items#item_crank', via: [:put], :as => :item_cranks
  match '/inventory-add' => 'inventory#inventory_add', via: [:put], :as => :inventory_add


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
