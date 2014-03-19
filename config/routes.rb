App::Application.routes.draw do

get "/" => "main#action_home"

get "/login" => "main#action_login"

get "/new_user" => "main#action_new_user"

post "/new_user" => "main#action_new_user_post"

get "/about" => "main#action_about"

get "/contact" => "main#action_contact"

get "/more_info/:id" => "main#action_more_info_id"

get "/sales_flyer_edit/" => "main#action_sales_flyer_edit"

post "/sales_flyer_edit/" => "main#action_sales_flyer_edit_post"

get "/edit_old" => "main#action_edit_old"

get "/add_new" => "main#action_add_new"

post "/add_new" => "main#action_add_new_post"
  
get "/:product_category" => "main#action_product_category"

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
