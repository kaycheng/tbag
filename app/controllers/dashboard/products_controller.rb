class Dashboard::ProductsController < Dashboard::BaseController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.includes(:vendor)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to dashboard_products_path, notice: "Product is created successfully."
    else
      render new_dashboard_product_path, notice: "There are some errors occurred. Please check again."
    end
  end

  def update
    if @product.update(product_params)
      redirect_to edit_dashboard_product_path(@product), notice: "Product is updated successfully."
    else
      render edit_dashboard_product_path(@product), notice: "There are some errors occurred. Please check again."
    end
  end

  def destroy
    @product.delete
    redirect_to dashboard_products_path, notice: "The product is deleted successfully."
  end

  private
  def product_params
    params.require(:product).permit(:name, :content, :list_price, :sell_price, :on_sell, :vendor_id)
  end

  def find_product
    @product = Product.friendly.find(params[:id])
  end
end