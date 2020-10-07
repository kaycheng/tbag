class WelcomeController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).limit(4)
  end
end