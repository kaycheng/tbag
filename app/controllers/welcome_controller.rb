class WelcomeController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).limit(4)
  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[:q]}%")
  end
end