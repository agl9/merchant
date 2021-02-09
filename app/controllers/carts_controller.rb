class CartsController < ApplicationController
 
  before_action :load_order, only: [:create]
  before_action :set_cart, only: %i[ show edit update destroy ]


  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = @order.carts.new(product_id: params[:product_id], quantity: 1)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @order, notice: "Items added to cart" }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:product_id, :quantity, :order_id)
    end

    def load_order
        @order = Order.find_or_initialize_by(id: session[:order_id])
      if @order.new_record?
        @order.status = 'Unsubmitted'
        @order.save!
        session[:order_id] = @order.id
      end
    end
end
