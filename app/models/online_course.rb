class OnlineCourse < ActiveRecord::Base
  attr_accessible :description, :market_sector_id, :position, :price_in_pennies, :title
end
