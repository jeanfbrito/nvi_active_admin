class OnsiteLesson < ActiveRecord::Base
  attr_accessible :description, :down_payment_price_in_pennies, :price_in_pennies, :title
  belongs_to :onsite_course
  
end
