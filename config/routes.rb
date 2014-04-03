App::Application.routes.draw do

get "/" => "main#index"

get "/sign_in" => "main#sign_in"

post "/sign_in" => "main#sign_in_post"

get "/log_out" => "main#log_out"

get "/new_user" => "main#new_user"

post "/new_user" => "main#new_user_post"

get "/about" => "main#about"

get "/contact" => "main#contact"

get "/more_info/:id" => "main#more_info_id"

get "/category_sale/" => "main#category_sale_edit"

post "/category_sale/" => "main#category_sale_edit_post"

get "/product_sale/" => "main#product_sale_edit"

post "/product_sale/" => "main#product_sale_edit_post"

get "/edit_old" => "main#edit_old"

post "/edit_old" => "main#edit_old_post"

get "/edit_user" => "main#edit_user"

post "/edit_user" => "main#edit_user_post"

get "/add_new" => "main#add_new"

post "/add_new" => "main#add_new_post"
  
get "/:product_category" => "main#product_category"

end
