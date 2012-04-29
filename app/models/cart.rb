class Cart < ActiveRecord::Base
  attr_accessible :completed, :user_id
  has_many :line_items
  belongs_to :user

  scope :incomplete, where(completed: false)
  scope :complete, where(completed: true)

  def size
    self.line_items.count
  end

  def empty?
    self.size == 0
  end

  def total
    total_in_pennies / 100.0
  end

  def total_in_pennies
    LineItem.where(cart_id: self.id).sum(:price_in_pennies)
  end

  def finalize!
    Stripe::Charge.create(
      :amount => self.total_in_pennies,
      :currency => "usd",
      :customer => self.user.stripe_customer_token, # obtained with Stripe.js
      :description => "Charge for #{self.user.email}, cart id: #{self.id}"
    )
    self.completed = true
    self.save
  end
end
