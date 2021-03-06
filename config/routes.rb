Rails.application.routes.draw do
  get 'meals/index',to: 'meals#index',as: :meals

  get 'orders/new',as: :orders_new
  get 'orders/create'
  get 'orders',to: 'orders#index',as: :orders
  # get 'cafeteria',to: 'cafeterias#index',as: :cafeterias

  get 'orders/:order_id/show',to: 'orders#show',as: :show_order

  resources :products

  devise_for :users, path_names: { sign_in: 'login',
                                   sign_out: 'logout', 
                                   sign_up: 'register' }

  # Cart
  get '/cart', to: 'carts#show', as: :cart
  put 'add/:product_id', to: 'carts#add', as: :add_to
  put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  put 'change_quantity',to: 'carts#change_quantity',as: :change_quantity
  put 'calculate_amount',to: 'carts#amount',as: :calculate_amount
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get '/address',to: 'addresses#new',as: :new_address
  get '/addresses',to: 'addresses#index',as: :select_address
  post '/address',to: 'addresses#create',as: :create_address

  get '/', to: 'products#index'
  get '/order', to: 'orders#new', as: :new_order
  post '/create_order', to: 'orders#create', as: :create_order

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
