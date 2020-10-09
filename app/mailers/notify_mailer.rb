class NotifyMailer < ApplicationMailer
  
  def pay_confirm(user, order)
    @user = user
    @order = order
    mail to: @user.email, subject: "Order #{@order.num} is created"
  end

  def pay_cancelled(user, order)
    @user = user
    @order = order
    mail to: @user.email, subject: "Order #{@order.num} is cancelled and refunded."
  end

  def order_cancelled(user, order)
    @user = user
    @order = order
    mail to: @user.email, subject: "Order #{@order.num} is cancelled."
  end
end
