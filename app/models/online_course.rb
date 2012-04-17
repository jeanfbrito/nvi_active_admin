class OnlineCourse < ActiveRecord::Base
  attr_accessible :description, :market_sector_id, :position, :price_in_pennies, :title
  belongs_to :instructor
  belongs_to :market_sector
  has_many :online_lessons
end
