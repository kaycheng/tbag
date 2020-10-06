class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:checkout]

  def show
  end

  def destroy
    session[:cart_0429] = nil
    redirect_to root_path, notice: "The cart is empty."
  end

  def checkout
    @order = current_user.orders.build
  end
end