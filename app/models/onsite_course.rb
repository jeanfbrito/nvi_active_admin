class OnsiteCourse < ActiveRecord::Base
  attr_accessible :description, :down_payment_price_in_pennies, :price, :price_in_pennies, :title, :position, :market_sector_id
  has_many :onsite_course_locations
  has_many :instructors, through: :onsite_course_locations
  has_many :locations, through: :onsite_course_locations
  has_many :onsite_lessons, order: :position
  has_many :line_items, as: :purchasable
  belongs_to :market_sector, touch: true
  acts_as_list
  alias_method :lessons, :onsite_lessons

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

  def instructor_at(location)
    self.onsite_course_locations.where(location_id: location.id).first.instructor
  end

  def at(location)
    self.onsite_course_locations.where(location_id: location.id).first
  end

end
