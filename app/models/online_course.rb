class OnlineCourse < ActiveRecord::Base
  attr_accessible :description, :market_sector_id, :position, :price_in_pennies, :title, :instructor_id
  acts_as_list
  belongs_to :instructor
  belongs_to :market_sector
  has_many :online_lessons, order: :position
  has_many :line_items, as: :purchasable

  alias_method :lessons, :online_lessons

  def price
    self.price_in_pennies / 100.0
  end

  def price=(new_price)
    self.price_in_pennies = new_price * 100
  end
end
