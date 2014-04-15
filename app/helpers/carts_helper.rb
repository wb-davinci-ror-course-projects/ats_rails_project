module CartsHelper
  def add_to_cart (x)
    "<h5 class='pad'>
        #{label_tag :quantity}
        #{text_field_tag :quantity, 1, size: 1}
        #{button_tag "Add to cart", name: 'product_id', value: "#{x}"}
     </h5>".html_safe
  end
end
