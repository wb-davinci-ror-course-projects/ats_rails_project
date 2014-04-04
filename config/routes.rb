App::Application.routes.draw do

get "/admin"                  => "admin#index",                     as: "admin_signin"
get "/admin/links"            => "admin#links",                     as: "links"
get "/admin/new"              => "admin#new",                       as: "new_product"
post "/admin"                 => "admin#create",                    as: "new_product1"
get "/admin/:id/edit"         => "admin#edit",                      as: "edit_product"
put "/admin/:id"              => "admin#update",                    as: "edit_product1"
get "/admin/product_sale"     => "admin#product_sale",              as: "/product_sale"
post "/admin/product_sale/"   => "admin#product_sale_edit_post",    as: "/product_sale1" 
get "/admin/category_sale/"   => "admin#category_sale_edit",        as: "/category_sale"
post "/admin/category_sale/"  => "admin#category_sale_edit_post",   as: "/category_sale1"  


get "/user"           => "user#index",                 as: "sign_in"
post "/user/:id"      => "user#update",                as: "logged_in"
get "/user/new"       => "user#new"
post "/user"          => "user#create"
get "/user/:id/edit"  => "user#edit"
put "/user/:id"       => "user#update"
get "/user/logout"    => "user#logout"


get "/"                   => "main#index"
get "/about"              => "main#about"
get "/contact"            => "main#contact"
get "/:product_category"  => "main#product_category"
get "/more_info/:id"      => "main#more_info_id"

end
