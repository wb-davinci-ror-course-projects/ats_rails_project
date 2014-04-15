module MainHelper

def flash_alert (x)
 if flash[:"#{x}"] != nil
  "<div class='alert alert-#{x}'>
    #{flash[:"#{x}"]}
  </div>".html_safe
  end
end

def out_of_stock(q, i)
  if q > 0 
    add_to_cart(i)
  else 
    "This item is currently out of stock.".html_safe
  end
end
end
