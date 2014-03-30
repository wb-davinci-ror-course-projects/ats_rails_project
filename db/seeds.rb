# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! username: "ts9753", 
first_name: "Tracy", 
last_name: "Smith", 
phone_number: "303-921-6168", 
email_address: "ts9753@yahoo.com",
password: "ts9753",
password_confirmation: "ts9753",
shipping_first_name: "Tracy", 
shipping_last_name: "Smith", 
shipping_address1: "5712 Asbury Pl", 
shipping_address2: "200", 
shipping_city: "Lakewood", 
shipping_state: "CO", 
shipping_zip: "80227", 
shipping_phone_number: "303-921-6168", 
billing_first_name: "Tracy", 
billing_last_name: "Smith", 
billing_address1: "5712 Asbury Pl", 
billing_address2: "200", 
billing_city: "Lakewood", 
billing_state: "CO", 
billing_zip: "80227", 
billing_phone_number: "303-921-6168"

User.create! username: "kl9753", 
first_name: "Karen", 
last_name: "Love", 
phone_number: "303-921-6169", 
email_address: "kl9753@yahoo.com", 
password: "*kl9753", 
password_confirmation: "*kl9753",
shipping_first_name: "Rich", 
shipping_last_name: "Love", 
shipping_address1: "5712 Asbury Pl", 
shipping_city: "Romeoville", 
shipping_state: "IL", 
shipping_zip: "80228", 
shipping_phone_number: "303-921-6169", 
billing_first_name: "Katelyn", 
billing_last_name: "Anders", 
billing_address1: "5714 Asbury Pl", 
billing_address2: "", 
billing_city: "Altoona", 
billing_state: "PA", 
billing_zip: "16602", 
billing_phone_number: "303-921-6170"

Category.create! name: "Diamond Products"
Category.create! name: "Safety Equipment"
Category.create! name: "Sand Paper"
Category.create! name: "Glues & Sealer"
Category.create! name: "Wet & Dry Pads"
Category.create! name: "Other Products"

CategorySale.create! category_name: "Diamond Products",
percent_off: 0,
category_id: 1

CategorySale.create! category_name: "Safety Equipment",
percent_off: 0,
category_id: 2

CategorySale.create! category_name: "Sand Paper",
percent_off: 0,
category_id: 3

CategorySale.create! category_name: "Glues & Sealer",
percent_off: 0,
category_id: 4

CategorySale.create! category_name: "Wet & Dry Pads",
percent_off: 0,
category_id: 5

CategorySale.create! category_name: "Other Products",
percent_off: 0,
category_id: 6


Product.create! product_code: "se-ltxg-lg-strmd",
category: "Safety Equipment",
name: "StarMed Latex Gloves",
quantity: 1,
description: "StarMed large, powder-free latex golves",
price: "11.00",
image: "se-ltxg-lg-strmd",
category_id: 2,
more_info: "100 gloves to a box",
percent_off: 0

Product.create! product_code: "sp5-80-hermes",
category: "Sand Paper",
name: "Hermes sand paper",
quantity: 1,
description: "Hermes velcro sand paper",
price: "25.00",
image: "sp5-80-hermes",
category_id: 3,
more_info: "50 to a box",
percent_off: 0

Product.create! product_code: "cp-ch-4oz",
category: "Glues & Sealer",
name: "Cream Hardener",
quantity: 1,
description: "Cream hardener, 4 oz tube",
price: "6.00",
image: "cp-ch-4oz",
category_id: 4,
more_info: "",
percent_off: 0

Product.create! product_code: "ms-mrk-wht-skm",
category: "Other Products",
name: "Super Met-al Marker",
quantity: 1,
description: "Super Met-al white marker",
price: "4.00",
image: "ms-mrk-wht-skm",
category_id: 6,
more_info: "Metal tip",
percent_off: 0

Product.create! product_code: "cp-prkg-qt-ats",
category: "Glues & Sealer",
name: "ATS Polyester Knife Grade",
quantity: 1,
description: "1 quart",
price: "20.00",
image: "cp-prkg-qt-ats",
category_id: 4,
more_info: "MIXING: Use with cream hardener catalyst. Mix ratio is 100:4. Mix thoroughly.
APPLICATION: For best results, adhesive and surfaces to be bonded, should be at room temperature 75 F,
prior to and during mixture, application, and curing of adhesive. SURFACE PREPARATION: Surfaces to be bonded
must be absolutely clean and can not be saturated with water.",
percent_off: 0

Product.create! product_code: "pp4-acp-0050",
category: "Wet & Dry Pads",
name: "ACP Polishing Pads",
quantity: 1,
description: "50 grit",
price: "12.00",
image: "pp4-acp-0050",
category_id: 5,
more_info: "",
percent_off: 0

Product.create! product_code: "abc-121",
category: "Diamond Products",
name: "name of product 1",
quantity: 1,
description: "sample product diamond",
price: "9.99",
image: "abc-123",
category_id: 1,
more_info: "There will be product information here like specs, application and advice.
There will be product information here like specs, application and advice.
There will be product information here like specs, application and advice.",
percent_off: 0

Product.create! product_code: "abc-122",
category: "Safety Equipment",
name: "name of product 2",
quantity: 1,
description: "sample product safety",
price: "8.99",
image: "abc-123",
category_id: 2,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0

Product.create! product_code: "abc-123",
category: "Sand Paper",
name: "name of product 3",
quantity: 1,
description: "sample product sand",
price: "7.99",
image: "abc-123",
category_id: 3,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0


Product.create! product_code: "abc-124",
category: "Glues & Sealer",
name: "name of product 4",
quantity: 1,
description: "sample product glue",
price: "6.99",
image: "abc-123",
category_id: 4,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0

Product.create! product_code: "abc-125",
category: "Wet & Dry Pads",
name: "name of product 5",
quantity: 1,
description: "sample product pads",
price: "5.99",
image: "abc-123",
category_id: 5,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0

Product.create! product_code: "abc-126",
category: "Other Products",
name: "name of product 6",
quantity: 1,
description: "sample product other",
price: "4.99",
image: "abc-123",
category_id: 6,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0

Product.create! product_code: "abc-127",
category: "Diamond Products",
name: "name of product 7",
quantity: 1,
description: "sample product diamond",
price: "9.99",
image: "abc-123",
category_id: 1,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0

Product.create! product_code: "abc-128",
category: "Safety Equipment",
name: "name of product 8",
quantity: 1,
description: "sample product safety",
price: "8.99",
image: "abc-123",
category_id: 2,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0

Product.create! product_code: "abc-129",
category: "Sand Paper",
name: "name of product 9",
quantity: 1,
description: "sample product sand",
price: "7.99",
image: "abc-123",
category_id: 3,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0

Product.create! product_code: "abc-130",
category: "Glues & Sealer",
name: "name of product 10",
quantity: 1,
description: "sample product glue",
price: "6.99",
image: "abc-123",
category_id: 4,
more_info: "There will be product information here like specs, application and advice.
There will be product information here like specs, application and advice.
There will be product information here like specs, application and advice.",
percent_off: 0

Product.create! product_code: "abc-131",
category: "Wet & Dry Pads",
name: "name of product 11",
quantity: 1,
description: "sample product pads",
price: "5.99",
image: "abc-123",
category_id: 5,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0

Product.create! product_code: "abc-132",
category: "Other Products",
name: "name of product 12",
quantity: 1,
description: "sample product other",
price: "4.99",
image: "abc-123",
category_id: 6,
more_info: "This section will handle product details, applications and
advice on use.",
percent_off: 0

