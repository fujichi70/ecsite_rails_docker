class Admins::ProductsController < Admins::ApplicationController
  before_action :set_admins_product, only: %i[ show edit update destroy ]

  # GET /admins/products or /admins/products.json
  def index
    @admins_products = Product.order(created_at: :ASC)
  end

  # GET /admins/products/1 or /admins/products/1.json
  def show(id:)
    @admins_product = Product.find(id)
  end
  
  # GET /admins/products/new
  def new(product: nil, product_description: nil, product_price: nil, product_quantity: nil, image: nil)
    @admins_product = Product.new
  end

  # GET /admins/products/1/edit
  def edit(id:)
    @admins_product = Product.find(id)

  end
  
  # POST /admins/products or /admins/products.json
  def create
    @admins_product = Product.new(admins_product_params)
    if @admins_product.save
      return redirect_to admins_products_path, notice: "登録しました。"
    else
      render "new"
    end

    # respond_to do |format|
    #   if @admins_product.save
    #     format.html { redirect_to admins_product_url([:admins, @admins_product]), notice: "Product was successfully created." }
    #     format.json { render :show, status: :created, location: @admins_product }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @admins_product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /admins/products/1 or /admins/products/1.json
  def update(id:)
    @admins_product = Product.find(id)
    @admins_product.update(admins_product_params)

    return redirect_to admins_products_path, notice: "更新しました。"
    
    # respond_to do |format|
    #   if @admins_product.update(admins_product_params)
    #     format.html { redirect_to admins_product_url(@admins_product), notice: "Product was successfully updated." }
    #     format.json { render :show, status: :ok, location: @admins_product }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @admins_product.errors, status: :unprocessable_entity }
    #   end

  end

  # DELETE /admins/products/1 or /admins/products/1.json
  def destroy
    @admins_product.destroy

    respond_to do |format|
      format.html { redirect_to admins_products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_product
      @admins_product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def admins_product_params
    #   params.fetch(:admins_product, {})
    # end

    def admins_product_params
      params.permit(:product, :product_description, :product_price, :product_quantity, :image)
    end

    
end
