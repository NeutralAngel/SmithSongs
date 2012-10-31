class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  attr_accessible :name, :email, :stripe_token, :stripe_card_token,
                  :ship_line1, :ship_line2, :ship_city, :ship_state, :ship_zip
  validates :name, :email, :ship_line1, :ship_city, :ship_state, :ship_zip, :presence => true
  attr_accessor :stripe_card_token

  def add_line_items_from_cart(cart)
    @total = cart.total_price
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def save_with_payment
    @total_in_cents = @total * 100
    if valid?
      charge = Stripe::Charge.create( :amount => Integer(@total_in_cents),
                                      :currency => "usd",
                                      :card => stripe_card_token,
                                      :description => self.name )
      self.stripe_token = charge.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating charge: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
