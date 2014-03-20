BfhcfApp::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :devotionals do
    collection do
      get :list
    end
  end
  resources :sermons do
    collection do
      get :list
    end
    member do
      get :display
    end
  end
  resources :events do
    collection do
      get :list
    end
  end
  resources :galleries do
    collection do
      get :list
    end
  end
  resources :gallery, controller: 'galleries' do
    collection do
      get :list
    end
  end
  resources :album, controller: 'galleries' do
    collection do
      get :list
    end
  end

  resources :images do
    collection do
      delete 'destroy_multiple'
    end
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  #resource :posts

  get 'devotionals/list'
  get 'sermons/list'


  get '404', :to => 'errors#page_not_found'
  get '422', :to => 'errors#server_error'
  get '500', :to => 'errors#server_error'


  root to: 'static_pages#home'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signup', :to => 'users#create', :via => :post, :as => :post_signup

  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'get'



  match '/about',           to: 'static_pages#about',       via: 'get'

  match '/devotionals',     to: 'devotionals#index',        via: 'get'
  match '/devotionals/new', :to => 'devotionals#create', :via => :post, :as => :post_devotionals_new

  match '/sermons',         to: 'sermons#index',            via: 'get'
  match '/sermons/new', :to => 'sermons#create', :via => :post, :as => :post_sermons_new


  match '/ministries',      to: 'static_pages#ministries',  via: 'get'
  match '/events',          to: 'events#index',             via: 'get'
  match '/contact',         to: 'static_pages#contact',     via: 'get'

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
