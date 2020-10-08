class ContactMailer < ApplicationMailer
  def say_hello(user)
    @user = user
    mail to: @user.email, subject: "Hello!"
  end
end
