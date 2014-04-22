class CartsController < ApplicationController
  #before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action  :check_quantity, only: [:create, :update] 
  
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
      
      @product            = Product.find(params[:product_id])
      @cart.price         = @product.price
      respond_to do |format|
          if @cart.save
            flash[:success] = "#{@product.name.titlecase} has been added to the cart"
            c_id = Category.find_by(name: @product.category).id
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
    @cart = Cart.find_by(product_id: params[:product_id])
    @product = Product.find(params[:product_id])
    @cart.quantity = params["quantity_#{@product.id}"]
      if @cart.save == true  #(cart_params)
        @carts = Cart.where(cart_id: session[:cart_id])
        render :index and return
        #format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        #format.json { head :no_content }
      else
        flash[:error] = "There was an error"
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
    # user = User.find_by(username: session[:username])
#     link = view order
#     Pony.mail(
#       to:        user.email_address,
#       subject:   "Action Tool & Supply order receipt",
#       body:      "If the link below doesn't work you can copy and paste this url: #{link}.",
#       html_body: "To view your order click this link:  <b>#{link}</b>"
#     )
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
      flash.now[:info] = "We apologize, only <b style='color: rgba(3, 3, 100, 0.8)'>#{product.quantity.to_i}</b>
      or less of product <b>#{product.name}</b>, can be ordered at this time".html_safe
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
