BfhcfApp::Application.routes.draw do
  resources :devotionals

  resources :users

  get "gallery/index"
  get "events/index"
  get "static_pages/about"
  get "static_pages/home"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  resource :posts

  root to: 'static_pages#home'

  match '/about',    to: 'static_pages#about', via: 'get'
  match '/devotionals',    to: 'devotionals#index', via: 'get'
  match '/sermons',    to: 'sermons#index', via: 'get'
  match '/sermons/show',    to: 'sermons#show', via: 'get'
  match '/ministries',    to: 'static_pages#ministries', via: 'get'
  match '/events',    to: 'events#index', via: 'get'
  match '/gallery',    to: 'gallery#index', via: 'get'
  match '/contact',    to: 'static_pages#contact', via: 'get'

  match '/signup',  to: 'users#new',            via: 'get'

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
