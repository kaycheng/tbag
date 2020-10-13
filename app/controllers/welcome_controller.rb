class WelcomeController < ApplicationController
  def index
    @featured_products = Product.order(id: :asc).limit(4)
    @newest_products = Product.order(created_at: :desc).limit(4)
    @welcome_categories = Category.order(id: :asc).limit(3)
  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[:q]}%")
  end
end