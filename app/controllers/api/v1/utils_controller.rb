class Api::V1::UtilsController < ApplicationController
  def subscribe
    email = params['subscribe']['email']
    sub = Subscribe.new(email: email)

    if sub.save
      render json: { status: 'ok', email: email }
    else
      render json: { status: 'duplicated', email: email}
    end
  end

  def cart
    product = Product.friendly.find(params[:id])
    if product
      cart = Cart.from_hash(session[:cart_0429])
      cart.add_item(product.code)
      session[:cart_0429] = cart.serialize

      render json: { status: 'ok', item: cart.items.count }
    end
  end
end