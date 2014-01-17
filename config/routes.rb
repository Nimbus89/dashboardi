OpenVisu::Application.routes.draw do

  

  get "editor/:page_id", to: "editor#show"
  get "page/index"
  get "page/edit"
  get "page/new"
  get "page/show"
  resources :panel_types
  resources :data_sources
  get "sse/oldRandom/", to: "sse#oldRandom"
  get "sse/random/:project_id", to: "sse#random"
  get "sse/ping/:source_id", to: "sse#ping"

  get "websocket/rand3"

  get "visualisation/example"
  get "visualisation/:project_id", to: "visualisation#show"
  get "visualisation/:project_id/:page_id", to: "visualisation#show"
  root to: 'application#welcome'
  
  devise_for :users
  
  resources :projects

  resources :pages

  resources :panels
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
