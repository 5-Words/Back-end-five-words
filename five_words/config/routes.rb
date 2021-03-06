Rails.application.routes.draw do
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

  root "registrations#index"

  post "/signup", to: "registrations#create"
  post "/login", to: "registrations#login"
  put "/user/avatar", to: "registrations#add_avatar"
  delete "/delete", to: "registrations#destroy"

  get "user/profile/public/:username", to: "users#user_profile"
  get "user/profile/private", to: "users#private_profile"

  put "/user/edit", to: "users#edit"

  post "/words/create", to: "words#creates"
  post "/create", to: "words#create"
  put "words/edit", to: "words#edit"

  #get "/words/match", to: "words#match"
  #get "/words/category", to: "words#search_category"
  #get "/users/:id/words", to: "words#user_words"

  get "user/all", to: "users#all"

  post "user/gallery", to: "images#add"
  get "user/gallery", to: "images#index"
  get "user/image/:id", to: "images#image"
  delete "image/destroy/:id", to: "images#destroy"

  get "/words/user/:category", to: "words#user_category"
  get "/words/matches/:category", to: "words#user_words"
  get "/words/:category", to: "words#user_words"
  get "/category/:category", to: "words#search_category"
  get "/match/:word/:category", to: "words#match"

  post "/user/add_friend/:username", to: "friends#add"
  delete "friend/destroy/:username", to: "friends#destroy"
  get "user/friends", to: "friends#index"
  get "friend/profile/:username", to: "friends#friend_profile"
  get "friend/gallery/:username", to: "friends#friend_gallery"
  get "friend/image/:id", to: "images#friend_image"

  post "/user/message", to: "messages#new"

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
