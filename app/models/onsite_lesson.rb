class OnsiteLesson < ActiveRecord::Base
  attr_accessible :description, :down_payment_price, :price, :title
  belongs_to :onsite_course
  has_many :onsite_lesson_locations
  has_many :locations, through: :onsite_lesson_locations

  def down_payment_price
    self.down_payment_price_in_pennies / 100.0
  end

  def down_payment_price=(new_down_payment_price)
    self.down_payment_price_in_pennies = new_down_payment_price * 100
  end

  def price
    self.price_in_pennies / 100.0
  end

  def price=(new_price)
    self.price_in_pennies = new_price * 100
  end

end
