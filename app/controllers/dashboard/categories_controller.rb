class Dashboard::CategoriesController < Dashboard::BaseController
  before_action :find_category, only: [:edit, :update, :destroy, :sort]

  def index
    @categories = Category.order(position: :asc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to dashboard_categories_path, notice: "Category was created successfully."
    else
      render new_dashboard_category_path, notice: "There are some errors occurred."
    end
  end

  def update
    @category.update(category_params)
    redirect_to edit_dashboard_category_path(@category), notice: "Category was updated successfully."
  end

  def destroy
    @category.delete
    redirect_to dashboard_categories_path, notice: "Category was deleted successfully."
  end

  def sort
    @category.insert_at(params[:to].to_i + 1)
    render json: { status: 'ok' }
  end

  private
  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end