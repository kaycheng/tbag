class OrdersController < ApplicationController

  def create
    @order = current_user.orders.build(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(sku_id: item.sku_id, quantity: item.quantity)
    end

    if @order.save
      resp = Faraday.post("#{ENV['LINE_PAY_ENDPOINT']}/v2/payments/request") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['X-LINE-ChannelId'] = ENV['LINE_PAY_ID']
        req.headers['X-LINE-ChannelSecret'] = ENV['LINE_PAY_SECRET']
        req.body = {
          productName: "Fighting",
          amount: current_cart.total_price.to_i,
          currency: "TWD",
          confirmUrl: "http://localhost:3000/orders/confirm",
          orderId: @order.num
        }.to_json
        
      end

      result = JSON.parse(resp.body)
      if result["returnCode"] == "0000"
        payment_url = result["info"]["paymentUrl"]["web"]
        redirect_to payment_url
      else
        render 'carts/checkout', notice: "Errors occurred"
      end
    end
  end

  def confirm
    resp = Faraday.post("#{ENV['LINE_PAY_ENDPOINT']}/v2/payments/#{params[:transactionId]}/confirm") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-LINE-ChannelId'] = ENV['LINE_PAY_ID']
      req.headers['X-LINE-ChannelSecret'] = ENV['LINE_PAY_SECRET']
      req.body = {
        amount: current_cart.total_price.to_i,
        currency: "TWD",
      }.to_json
    end

    result = JSON.parse(resp.body)

    if result["returnCode"] == "0000"
      order_id = result["info"]["orderId"]
      transaction_id = result["info"]["transactionId"]
      # Change order status
      order = current_user.orders.find_by(num: order_id)
      order.pay!(transaction_id: transaction_id)
      # Clear current_cart
      session[:cart_0429] = nil
      redirect_to root_path, notice: "Pay successfully."
    else
      redirect_to root_path, notice: "Some errors occurred."
    end
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :tel, :address, :note)
  end


end