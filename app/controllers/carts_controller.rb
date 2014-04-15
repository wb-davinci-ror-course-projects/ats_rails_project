class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.where(cart_id: session[:cart_id])
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    session[:cart_id]   = params[:authenticity_token]
    @cart               = Cart.new#(cart_params)
    @cart.cart_id       = params[:authenticity_token]
    @cart.product_id    = params[:product_id]
    @cart.quantity      = params[:quantity]
    @product            = Product.find(params[:product_id])
    @cart.price         = @product.price

    respond_to do |format|
      if @cart.save
        flash[:info] = "#{@product.name} was added to cart"
        c_id = Category.find_by(name: @product.category).id
        redirect_to "/main/#{c_id}" and return
        #format.html { redirect_to @cart, notice: 'Product was added to your cart.' }
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    @cart = Cart.find_by(cart_id: session[:cart_id])
    respond_to do |format|
      if @cart.update#(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(1)#(params[:cart_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
#     def cart_params
#       params.require(:cart).permit(:product_id, :quantity, :ship_method)
#     end
end
