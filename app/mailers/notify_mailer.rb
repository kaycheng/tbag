class NotifyMailer < ApplicationMailer
  
  def pay_confirm(user, order)
    @user = user
    @order = order
    mail to: @user.email, subject: "Order #{@order.num} is created"
  end

end
