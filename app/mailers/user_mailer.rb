class UserMailer < ApplicationMailer

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject:"Here is your order receipt for #{order.id}")
  end 

end
