class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :purchasable_id, :purchasable_type, :reservation, :location_id
  belongs_to :cart
  belongs_to :purchasable, polymorphic: true
  validates_presence_of :cart_id
  validates_presence_of :purchasable_id
  validates_presence_of :purchasable_type
  validate :seats_available, if: :reservation
  before_save :add_price

  attr_accessor :reservation, :location_id

  def add_price
    if self.reservation
      self.price_in_pennies = self.purchasable_id.down_payment_price_in_pennies
    else
      self.price_in_pennies = self.purchasable.price_in_pennies
    end
  end

  private

  def seats_available
    OnsiteLessonLocations.where(onsite_lesson_id: self.purchasable_id, location_id: self.location_id).first.seats_available?
  end

end
