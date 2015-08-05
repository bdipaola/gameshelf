Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'games#index'

  # Example of regular route:
    get 'users/:id/dashboard' => 'users#dashboard'

    get 'logout' => 'login#destroy'

    post 'categories/:id' => 'categories#show'

    get 'users/:id/friends' => 'users#friends'
    put 'users/:id/add_friend' => 'users#add_friend'
    delete 'users/:id/friends' => 'users#remove_friend'

    get 'users/:id/friends/games/:game_id' => 'users#friends_with_game'

    put '/users/:id/games/:game_id/shelf/add' => 'games#add_to_shelf'
    put '/users/:id/games/:game_id/shelf/remove' => 'games#remove_from_shelf'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

  resources :users do
    resources :games
    resources :comments
  end

  resources :categories, only: [:index, :show] do
    resources :games, only: [:index, :show]
  end

  resources :games, only: [:index, :show] do
    resources :comments
  end

  resources :login

  resources :search, only: [:index, :create]

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
