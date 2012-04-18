class OnsiteLesson < ActiveRecord::Base
  attr_accessible :description, :down_payment_price, :price, :title, :onsite_course_id, :price_in_pennies, :down_payment_price_in_pennies, :position
  belongs_to :onsite_course
  has_many :onsite_lesson_locations
  has_many :locations, through: :onsite_lesson_locations
  has_many :line_items, as: :purchasable
  after_create :import_locations

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

  def import_locations
    if self.onsite_course
      self.locations << self.onsite_course.locations
    end
  end

end
