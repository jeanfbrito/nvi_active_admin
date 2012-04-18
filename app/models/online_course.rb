class OnlineCourse < ActiveRecord::Base
  attr_accessible :description, :market_sector_id, :position, :price_in_pennies, :title, :instructor_id
  acts_as_list
  belongs_to :instructor
  belongs_to :market_sector
  has_many :online_lessons, order: :position

  alias_method :lessons, :online_lessons
end
