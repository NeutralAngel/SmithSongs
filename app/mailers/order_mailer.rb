class OrderMailer < ActionMailer::Base
  default from: "nathan.nontell@gmail.com"

  def order_confirmation(order)
    @order = order

    mail to: order.email, subject: "Thanks for your order!"
  end
end
