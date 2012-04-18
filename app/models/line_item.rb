class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :purchasable_id, :purchasable_type
  belongs_to :cart
  belongs_to :purchasable, polymorphic: true
  validates_presence_of :cart_id
  validates_presence_of :purchasable_id
  validates_presence_of :purchasable_type
  before_save :add_price

  def add_price
    self.price_in_pennies = self.purchasable.price_in_pennies
  end

end
