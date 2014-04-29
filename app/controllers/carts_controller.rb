class CartsController < ApplicationController
  #before_action :set_cart, only: [:show, :edit, :update, :destroy]
   before_action  :check_quantity, only: [:create, :update]
   before_action  :product_quantity_update, only: [:create] 
  
  def index
    @carts = Cart.where(cart_id: session[:cart_id])
    if @carts.first == nil
      @empty = "yes"
    end
  end
  
  def show
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    if Cart.find_by(product_id: params[:product_id], cart_id: session[:cart_id]) != nil
      @product = Product.find(params[:product_id])
      c_id = Category.find_by(name: @product.category).id
      flash[:info] = "#{@product.name.titlecase} has already been added to the cart.
                      The product's quantity can be adjusted in the cart."
      redirect_to "/main/#{c_id}" and return
    else
      session[:cart_id]   = params[:authenticity_token]
      @cart               = Cart.new#(cart_params)
      @cart.cart_id       = params[:authenticity_token]
      @cart.product_id    = params[:product_id]
      @product            = Product.find(@cart.product_id)
      @cart.quantity      = params["quantity_#{@product.id}"]
      category_percent_off = CategorySale.find_by(category_id: @product.category_id).percent_off
      if @product.percent_off <= category_percent_off
        price = @product.price * ((100-category_percent_off)/100)
      else
        price = @product.price * ((100-@product.percent_off)/100)
      end
      @cart.price         = price
      respond_to do |format|
      if @cart.save
        flash[:success] = "#{@product.name.titlecase} has been added to the cart"
        c_id = Category.find_by(name: @product.category).id
        @product.quantity = @product.quantity - @cart.quantity
        @product.save!
        redirect_to "/main/#{c_id}" and return
        format.json { render action: 'show', status: :created, location: @cart }
        #format.html { render action: 'new' }
        #format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end   
  end
  end
  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    old_cart = Cart.find_by(product_id: params[:product_id], cart_id: session[:cart_id])
    @product = Product.find(params[:product_id])
    @cart = Cart.find_by(product_id: params[:product_id], cart_id: session[:cart_id])
    @cart.quantity = params["quantity_#{@product.id}"]
    if @cart.quantity.to_i >= old_cart.quantity.to_i
      @product.quantity = @product.quantity.to_i - (@cart.quantity.to_i - old_cart.quantity.to_i)
    else
      @product.quantity = @product.quantity.to_i + (old_cart.quantity.to_i - @cart.quantity.to_i)
    end
    @product.save!
     if @cart.save == true  #(cart_params)
      @carts = Cart.where(cart_id: session[:cart_id])
      render :index and return
      #format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
      #format.json { head :no_content }
    else
      flash[:danger] = "There was an error"
      redirect_to home_page_path and return
      #format.html { render action: 'edit' }
      #format.json { render json: @cart.errors, status: :unprocessable_entity }
    end
  end

  def final_cart
      @carts = Cart.where(cart_id: session[:cart_id])
      render :final_cart and return
  end
  
  def place_order
    order_number = Order.last.id + 777
    Cart.all.each do |cart|
      Order.create! order_number: order_number, user_id: User.find_by(username: session[:username]).id, 
      product_id: cart.product_id, quantity: cart.quantity
      cart.delete
    end
    Order.create! order_number: order_number, user_id: User.find_by(username: session[:username]).id,
     tax: params[:tax], ship_cost: params[:ship_cost], order_total: params[:order_total]
     total_order = Order.where(order_number: order_number, user_id: User.find_by(username: session[:username]).id)
     order = Order.find_by(order_number: order_number, user_id: User.find_by(username: session[:username]))
     user = User.find_by(username: session[:username])
     total_amount = params[:order_total] 
     product_names =  total_order.collect do |p|
       if p.product_id != nil
         product_names=["#{Product.find(p.product_id).name}, price of each: $ #{"%.2f" % Product.find(p.product_id).price}, qty: #{p.quantity}        "'<br></br>'"^"]
       end
     end
     product_names.pop
     link = last_order_url(user.id, order.order_number)
    Pony.mail(
     to:        user.email_address,
     subject:   "Action Tool & Supply LLC order receipt",
     body:      "Sign into account and click this link #{last_order_url} to view your most recent order.
                  Order#: #{order.order_number}",
     html_body: test = "<b>Action Tool & Supply LLC</b>
                    <br></br>50 Rio Grande Blvd, Denver CO
                    <br></br>720-363-0163
                    <br></br>Sign into account and click this link 
                    <a href='#{link}'>View Last Order</a> to view most recent order.
                    <hr>
                    <br></br>Shipped to:
                    <br></br>           #{user.shipping_address1} #{user.shipping_address2}
                    <br></br>           #{user.shipping_city}, #{user.shipping_state} #{user.shipping_zip}
                    <br></br>Date: #{order.created_at.strftime('%-m/%-d/%y')} Time: #{order.updated_at.getlocal.strftime('%I:%M %p %Z')}
                    <hr>
                    <br></br>Products: <br></br>#{product_names.join(" ").split("^").to_yaml}
                    <br></br>Shipping: $#{"%.2f" % params[:ship_cost]}
                    <br></br>Taxes: $#{"%.2f" % params[:tax]}
                    <br></br><h4>Order Total: $#{"%.2f" % total_amount}</h4>
                    <h3>Thank you for your order.</h3>".html_safe 
     )
    flash[:info] = "Thank you. Your order has been placed. A receipt has been e-mailed."
    Cart.where(cart_id: session[:cart_id]).each do |c|
      c.delete
    end
    redirect_to home_page_path and return 
  end
  
  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end

  private
  
  def check_quantity
    product = Product.find(params[:product_id])
    if params["quantity_#{product.id}"].to_i > product.quantity && params[:button] == "update"
      @carts = Cart.where(cart_id: session[:cart_id])
      flash.now[:info] = "We apologize, the quantity can only be increased by <b style='color: rgba(3, 3, 100, 0.8)'>#{product.quantity.to_i}</b>
      or less of product <b>#{product.name}</b>, at this time".html_safe
      render :index and return
      elsif
        params["quantity_#{product.id}"].to_i > product.quantity
        flash[:info] = "We apologize, only <b style='color: rgba(3, 3, 100, 0.8)'>#{product.quantity.to_i}</b>
          or less of product <b>#{product.name}</b>, can be ordered at this time".html_safe
        c_id = Category.find_by(name: product.category).id
        redirect_to "/main/#{c_id}" and return
    else
      @cart = Cart.find_by(cart_id: session[:cart_id])
    end
  end
  
  def product_quantity_update
    Cart.all.each do |cart|
      product = Product.find(cart.product_id)
      if Time.now > cart.updated_at + (30 * 60)
        product.quantity = product.quantity + cart.quantity
        product.save!
        cart.delete
      end
    end
  end
    # Use callbacks to share common setup or constraints between actions.
#     def set_cart
#       if Cart.find(1) != nil
#         @cart = Cart.find(1)#(params[:cart_id])
#       else
#         @cart = Cart.find_by(cart_id: session[:cart_id])
#       end
#     end

    # Never trust parameters from the scary internet, only allow the white list through.
#     def cart_params
#       params.require(:cart).permit(:product_id, :quantity, :ship_method)
#     end
end
