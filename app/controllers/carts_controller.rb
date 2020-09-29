class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def destroy
    session[:cart_0429] = nil
    redirect_to root_path, notice: "The cart is empty."
  end

  def checkout
  end
end