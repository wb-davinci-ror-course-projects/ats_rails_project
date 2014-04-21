module MainHelper

def flash_alert (x)
 if flash[:"#{x}"] != nil
  "<div class='alert alert-#{x}'>
    #{flash[:"#{x}"]}
  </div>".html_safe
  end
end

def add_to_cart (p)
  if p.quantity > 0
    "<h5 color: black;'>#{label_tag :quantity}
    #{text_field_tag "quantity_#{p.id}", 1, size: 1}
    #{button_tag 'Add to cart', name: 'product_id', value: p.id}</h5>".html_safe
  else
    "<p class='pad' style='font-size: 14pt; color: black;'>
      <i>This item is currently out of stock.</i></p>".html_safe
  end
end

def image_display (p)
  if Image.find_by(name: p.product_code) == nil
      "<a class='a:hover' href='/images/#{p.image}.jpg/'>
        <img src='/images/#{p.image}.jpg/' width='180' height='135'></img>
      </a>".html_safe
  else
    image = Image.find_by(name: p.product_code)
      "<a class='a:hover' href='/images/#{p.image}.jpg/'>
        <img src='#{image_data_path(image.id, image.extension)}' width='180' height='135'>
       </a>".html_safe
  end 
end

end
