module MainHelper

def flash_alert (x)
 if flash[:"#{x}"] != nil
  "<div class='alert alert-#{x}'>
    #{flash[:"#{x}"]}
  </div>".html_safe
  end
end

end
