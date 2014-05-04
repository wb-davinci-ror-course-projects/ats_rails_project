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
    "<h5 class='pad'>#{label_tag :quantity}
    #{text_field_tag "quantity_#{p.id}", 1, size: 1}
    #{button_tag 'Add to cart', name: 'product_id', value: p.id}</h5>".html_safe
  else
    "<p class='pad' style='font-size: 14pt; color: black;'>
      <i>This item is currently out of stock.</i></p>".html_safe
  end
end

def image_display (p)
  if Image.find_by(name: p.product_code) == nil
      "<a href='/images/#{p.image}_big.jpg/'>
        <img class='zoomin_img zoomin_img:hover image' src='/images/#{p.image}.jpg/' width='250' height='187'></img>
      </a>".html_safe
  else
    image = Image.find_by(name: p.product_code)
      "<a href='/images/#{p.image}.jpg/'>
        <img class='image' src='#{image_data_path(image.id, image.extension)}' width='250' height='187'>
       </a>".html_safe
  end 
end

def pad_sizes
   [
    ['50', '0050'],
    ['100', '0100'],
    ['200', '0200'],
    ['400', '0400'],
    ['800', '0800'],
    ['1500', '1500'],
    ['3000', '3000'],
  ]
end


end
