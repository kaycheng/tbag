class OrdersController < ApplicationController
  before_action :find_order, only: [:cancel, :pay, :pay_confirm]

  def index
    @orders = current_user.orders.order(id: :desc)
  end

  def create
    @order = current_user.orders.build(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(sku_id: item.sku_id, quantity: item.quantity)
    end

    if @order.save
      linepay = LinepayService.new('payments/request')
      linepay.perform({
        productName: "TBag",
        amount: current_cart.total_price.to_i,
        currency: "TWD",
        confirmUrl: "https://tbagcem.herokuapp.com/orders/confirm",
        orderId: @order.num
      })

      if linepay.success?
        redirect_to linepay.payment_url
      else
        render 'carts/checkout', notice: "Errors occurred"
      end
    end
  end

  def confirm
    linepay = LinepayService.new("payments/#{params["transactionId"]}/confirm")
    linepay.perform({
      amount: current_cart.total_price.to_i,
      currency: "TWD"
    })

    if linepay.success?
      # Change order status
      @order = current_user.orders.find_by(num: linepay.order[:order_id])
      @order.pay!(transaction_id: linepay.order[:transaction_id])
      NotifyMailer.pay_confirm(current_user, @order).deliver_now
      # Clear current_cart
      session[:cart_0429] = nil
      redirect_to orders_path, notice: "Pay successfully."
    else
      redirect_to orders_path, notice: "There are some errors occurred."
    end
  end

  def cancel
    if @order.paid?
      linepay = LinepayService.new("payments/#{@order.transaction_id}/refund")
      linepay.perform(refundAmount: @order.total_price.to_i)
    
      if linepay.success?
        @order.cancel!
        NotifyMailer.pay_cancelled(current_user, @order).deliver_now
        redirect_to orders_path, notice: "Order #{@order.num} is cancelled and refunded."
      else
        redirect_to orders_path, notice: "Some errors occurred."
      end
    else
      @order.cancel!
      NotifyMailer.order_cancelled(current_user, @order).deliver_now
      redirect_to orders_path, notice: "Order #{@order.num} is cancelled."
    end
  end

  def pay
    linepay = LinepayService.new("payments/request")
    linepay.perform({
      productName: "BFF",
      amount: @order.total_price.to_i,
      currency: "TWD",
      confirmUrl: "https://tbagcem.herokuapp.com/orders/#{@order.id}/pay_confirm",
      orderId: @order.num
    })

    if linepay.success?
      redirect_to linepay.payment_url
    else
      redirect_to orders_path, notice: "There are some errors occurred."
    end
  end

  def pay_confirm
    linepay = LinepayService.new("payments/#{params[:transactionId]}/confirm")
    linepay.perform({
      amount: @order.total_price.to_i,
      currency: "TWD"
    })

    if linepay.success?
      @order.pay!(transaction_id: linepay.order[:transaction_id])
      NotifyMailer.pay_confirm(current_user, @order).deliver_now
      redirect_to orders_path, notice: "Pay successfully."
    else
      redirect_to orders_path, notice: "Some errors occurred."
    end
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :tel, :address, :note)
  end

  def find_order
    @order = current_user.orders.find(params[:id])
  end

end