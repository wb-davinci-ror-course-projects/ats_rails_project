App::Application.routes.draw do


get "/user"           => "user#index",                 as: "sign_in"
post "/user/:id"      => "user#update",                as: "logged_in"
get "/user/new"       => "user#new"
post "/user"          => "user#create"
get "/user/:id/edit"  => "user#edit"
post "/user/:id"      => "user#update"
get "/user/logout"    => "user#logout"



get "/" => "main#index"

get "/about" => "main#about"

get "/contact" => "main#contact"

get "/more_info/:id" => "main#more_info_id"

get "/category_sale/" => "main#category_sale_edit"

post "/category_sale/" => "main#category_sale_edit_post"

get "/product_sale/" => "main#product_sale_edit"

post "/product_sale/" => "main#product_sale_edit_post"

get "/edit_old" => "main#edit_old"

post "/edit_old" => "main#edit_old_post"

get "/add_new" => "main#add_new"

post "/add_new" => "main#add_new_post"
  
get "/:product_category" => "main#product_category"

end
