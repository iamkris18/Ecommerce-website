class MyProductsController < ApplicationController
  before_action :set_my_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update destroy ]

  # GET /my_products or /my_products.json
  def index
    @my_products = MyProduct.all
  end

  # GET /my_products/1 or /my_products/1.json
  def show
  end

  # GET /my_products/new
  def new
    @my_product = MyProduct.new
  end

  # GET /my_products/1/edit
  def edit
  end

  # POST /my_products or /my_products.json
  def create
    @my_product = MyProduct.new(my_product_params)

    respond_to do |format|
      if @my_product.save
        format.html { redirect_to my_product_url(@my_product), notice: "My product was successfully created." }
        format.json { render :show, status: :created, location: @my_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_products/1 or /my_products/1.json
  def update
    respond_to do |format|
      if @my_product.update(my_product_params)
        format.html { redirect_to my_product_url(@my_product), notice: "My product was successfully updated." }
        format.json { render :show, status: :ok, location: @my_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_products/1 or /my_products/1.json
  def destroy
    @my_product.destroy

    respond_to do |format|
      format.html { redirect_to my_products_url, notice: "My product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_product
      @my_product = MyProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_product_params
      params.require(:my_product).permit(:title, :quantity)
    end
end
