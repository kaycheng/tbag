class Dashboard::VendorsController < Dashboard::BaseController
  before_action :find_vendor, only: [:edit, :update, :destroy]

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to dashboard_vendors_path, notice: "Vendor is created successfully."
    else
      rendor 'new', notice: "There are some errors occurred."
    end
  end

  def update
    if @vendor.update(vendor_params)
      redirect_to dashboard_vendors_path, notice: "Vendor is updated successfully."
    else
      render 'edit', notice: "There are some errors occureed."
    end
  end

  def destroy
    @vendor.delete
    redirect_to dashboard_vendors_path, notice: "Vendor is deleted successfully."
  end

  private
  def find_vendor
    @vendor = Vendor.find(params[:id])
  end

  def vendor_params
    params.require(:vendor).permit(:title, :description, :online)
  end
end
