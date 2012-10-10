class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity, :product
  belongs_to :product
  belongs_to :cart
  after_initialize :init

  def init
    self.quantity ||= 1 
  end

  def total_price
    product.price * quantity
  end
end
