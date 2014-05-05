# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! username: "wendy", 
first_name: "Wendy", 
last_name: "Brannon",
company_name: "ATS", 
phone_number: "303-921-6168", 
email_address: "wb9753@gmail.com",
password: "1234",
password_confirmation: "1234",
shipping_first_name: "Wendy", 
shipping_last_name: "Brannon", 
shipping_address1: "5712 Asbury Pl", 
shipping_address2: "200", 
shipping_city: "Lakewood", 
shipping_state: "CO", 
shipping_zip: "80227", 
shipping_phone_number: "303-921-6168", 
billing_first_name: "Wendy", 
billing_last_name: "Brannon", 
billing_address1: "5712 Asbury Pl", 
billing_address2: "200", 
billing_city: "Lakewood", 
billing_state: "CO", 
billing_zip: "80227", 
billing_phone_number: "303-921-6168"

User.create! username: "grace", 
first_name: "Grace", 
last_name: "Hopper",
company_name: "US Navy",  
phone_number: "908-555-0101", 
email_address: "wd9753@yahoo.com",
password: "1234",
password_confirmation: "1234",
shipping_first_name: "Grace", 
shipping_last_name: "Hopper", 
shipping_address1: "123 Navy Blvd", 
shipping_address2: "", 
shipping_city: "Plainfield", 
shipping_state: "NY", 
shipping_zip: "07060", 
shipping_phone_number: "908-555-0101", 
billing_first_name: "Grace", 
billing_last_name: "Hopper", 
billing_address1: "123 Navy Blvd", 
billing_address2: "", 
billing_city: "Plainfield", 
billing_state: "NJ", 
billing_zip: "07060", 
billing_phone_number: "908-555-0101"

User.create! username: "bob", 
first_name: "Bob", 
last_name: "Bobsen",
company_name: "Planet Granite",  
phone_number: "303-555-1010", 
email_address: "wbsolutionsllc2@gmail.com",
password: "1234",
password_confirmation: "1234",
shipping_first_name: "Bob", 
shipping_last_name: "Bobsen", 
shipping_address1: "900 16th St", 
shipping_address2: "102", 
shipping_city: "Denver", 
shipping_state: "CO", 
shipping_zip: "80202", 
shipping_phone_number: "303-555-1010", 
billing_first_name: "Bob", 
billing_last_name: "Bobsen", 
billing_address1: "900 16th St", 
billing_address2: "102", 
billing_city: "Denver", 
billing_state: "CO", 
billing_zip: "80202", 
billing_phone_number: "303-555-1010",
credit_first_name: "Bob",
credit_last_name: "Bobsen",
credit_month: 8,
credit_year: 2015,
credit_security_code: 000


Category.create! name: "Diamond Products"
Category.create! name: "Safety Equipment"
Category.create! name: "Abrasives"
Category.create! name: "Glues & Sealer"
Category.create! name: "Pads"
Category.create! name: "Other Products"

CategorySale.create! category_name: "Diamond Products",
percent_off: 0,
category_id: 1

CategorySale.create! category_name: "Safety Equipment",
percent_off: 0,
category_id: 2

CategorySale.create! category_name: "Abrasives",
percent_off: 0,
category_id: 3

CategorySale.create! category_name: "Glues & Sealer",
percent_off: 0,
category_id: 4

CategorySale.create! category_name: "Pads",
percent_off: 0,
category_id: 5

CategorySale.create! category_name: "Other Products",
percent_off: 0,
category_id: 6


Product.create! product_code: "se-ltxg-lg-strmd",
category: "Safety Equipment",
name: "StarMed Latex Gloves",
quantity: 50,
description: "StarMed large, powder-free latex golves",
price: "11.00",
image: "se-ltxg-lg-strmd",
category_id: 2,
more_info: "100 gloves to a box",
percent_off: 0

Product.create! product_code: "sp5-80-hermes",
category: "Abrasives",
name: "Hermes sand paper",
quantity: 50,
description: "Hermes velcro sand paper",
price: "25.00",
image: "sp5-80-hermes",
category_id: 3,
more_info: "50 to a box",
percent_off: 0

Product.create! product_code: "cp-ch-4oz",
category: "Glues & Sealer",
name: "Cream Hardener",
quantity: 50,
description: "Cream hardener, 4 oz tube",
price: "6.00",
image: "cp-ch-4oz",
category_id: 4,
more_info: "Cream hardener, 4 oz tube",
percent_off: 0

Product.create! product_code: "ms-mrk-wht-skm",
category: "Other Products",
name: "Super Met-al Marker",
quantity: 50,
description: "Super Met-al white marker",
price: "4.00",
image: "ms-mrk-wht-skm",
category_id: 6,
more_info: "Metal tip",
percent_off: 0

Product.create! product_code: "cp-prkg-qt-ats",
category: "Glues & Sealer",
name: "ATS Polyester Knife Grade",
quantity: 5,
description: "1 quart",
price: "20.00",
image: "cp-prkg-qt-ats",
category_id: 4,
more_info: "MIXING: Use with cream hardener catalyst. Mix ratio is 100:4. Mix thoroughly.
APPLICATION: For best results, adhesive and surfaces to be bonded, should be at room temperature 75 F,
prior to and during mixture, application, and curing of adhesive. SURFACE PREPARATION: Surfaces to be bonded
must be absolutely clean and can not be saturated with water.",
percent_off: 0

Product.create! product_code: "sp-sil-xb150",
category: "Glues & Sealer",
name: "Silicone Sealant 10.1 oz",
quantity: 50,
description: "XtraBond 150 silicone sealant, 10 ounces",
price: "12.00",
image: "sp-sil-xb150",
category_id: 4,
more_info: "Mildew resistant",
percent_off: 0

Product.create! product_code: "pp4-acp-0050",
category: "Pads",
name: "ACP Polishing Pads",
quantity: 50,
description: "50 - 3000 grit",
price: "12.00",
image: "pp4-acp-0050",
category_id: 5,
more_info: "ACP polishing pads, 50 - 3000 grit",
percent_off: 0

Product.create! product_code: "4bp-fl",
category: "Pads",
name: "Backer Pad",
quantity: 50,
description: '4" flexible rubber backer pad',
price: "12.00",
image: "4bp-fl",
category_id: 5,
more_info: "Flexible, semi-rigid rubber with velco back",
percent_off: 0

Product.create! product_code: "tb-06-acpro",
category: "Diamond Products",
name: '6" Acpro Turbo Blade',
quantity: 0,
description: "Professional Turbo Blade",
price: "39.00",
image: "tb-06-acpro",
category_id: 1,
more_info: "",
percent_off: 0

Product.create! product_code: "antbr4024-acp-sl5811",
category: "Abrasives",
name: "Antique brush",
quantity: 50,
description: "Antique brush size 24",
price: "33.00",
image: "antbr4024-acp-sl5811",
category_id: 6,
more_info: "Antique brush size 24, snail lock with 5811 threads.",
percent_off: 0

Cart.create! product_id: 1, quantity: 2, ship_method: "first", cart_id: "1", price: 4 

Order.create! price_paid_for_product: 12

