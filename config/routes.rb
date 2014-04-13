App::Application.routes.draw do

get "/"                              => "main#index",              as: "home_page"
get "/main/about"                    => "main#about"
get "/main/contact"                  => "main#contact"
get "/main/:product_category"        => "main#product_category",   as: "category_path" 
get "/main/more_info/:id"            => "main#more_info_id"

get "/user"                     => "user#index",                  as: "user_signin"
post "/user/sign_in"            => "user#sign_in",                as: "user_signin1"
get "/user/new"                 => "user#new"
post "/user"                    => "user#create"
get "/user/email"               => "user#email",                  as: "email"
put "/user/send_email"          => "user#send_email",             as: "send_email"
get "/user/reset"               => "user#reset"
put "/user/reset"               => "user#reset_password",         as: "reset_password"
get "/user/ship_bill_info"      => "user#ship_bill_info",         as: "ship_info"  
put "/user/ship_bill_info_put"  => "user#update_ship",            as: "ship_update" 
get "/user/:id/edit"            => "user#edit"
put "/user/:id"                 => "user#update_user",            as: "user_update"
get "/user/logout"              => "user#logout"

get "/admin"                  => "admin#index",                     as: "admin_signin"
post "/admin/signin"          => "admin#signin",                    as: "admin_signedin"
get "/admin/links"            => "admin#links",                     as: "links"
get "/admin/new"              => "admin#new",                       as: "new_product"
post "/admin"                 => "admin#create",                    as: "new_product1"
get "/admin/:id/edit"         => "admin#edit",                      as: "edit_product"
put "/admin/:id"              => "admin#update",                    as: "edit_product1"
get "/admin/product_sale"     => "admin#product_sale",              as: "/product_sale"
post "/admin/product_sale/"   => "admin#product_sale_edit_post",    as: "/product_sale1" 
get "/admin/category_sale/"   => "admin#category_sale_edit",        as: "/category_sale"
post "/admin/category_sale/"  => "admin#category_sale_edit_post",   as: "/category_sale1"  
get "/admin/logout"           => "admin#logout"

get "/carts/ship_type"        => "carts#ship_type",                 as: "ship_type"
get "/carts/final_cart"       => "carts#final_cart",                as: "final_cart"
put "/carts/place_order"      => "carts#place_order",               as: "place_order"
resources :carts

end
