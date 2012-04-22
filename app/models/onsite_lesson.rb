class OnsiteLesson < ActiveRecord::Base
  attr_accessible :description, :down_payment_price, :price, :title, :onsite_course_id, :price_in_pennies, :down_payment_price_in_pennies, :position
  belongs_to :onsite_course, touch: true
  has_many :onsite_lesson_locations
  accepts_nested_attributes_for :onsite_lesson_locations, :allow_destroy => true
  has_many :locations, through: :onsite_lesson_locations
  has_many :line_items, as: :purchasable
  after_create :import_locations
  acts_as_list :scope => :onsite_course
  after_save :touch_dependencies

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

  def seats_remaining_at(location)
    self.onsite_lesson_locations.where(location_id: location.id).first.seats_remaining
  end

  def at(location)
    self.onsite_lesson_locations.where(location_id: location.id).first
  end

  def import_locations
    if self.onsite_course
      self.locations << self.onsite_course.locations
    end
  end

  private

  def touch_dependencies
    self.locations.each do |location|
      location.touch
    end
    self.onsite_lesson_locations.each do |oll|
      oll.touch
    end
  end

end
