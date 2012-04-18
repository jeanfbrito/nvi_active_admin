class OnsiteCourse < ActiveRecord::Base
  attr_accessible :description, :down_payment_price_in_pennies, :price_in_pennies, :title, :position
  has_many :onsite_course_locations
  has_many :instructors, through: :onsite_course_locations
  has_many :locations, through: :onsite_course_locations
  has_many :onsite_lessons
  has_many :line_items, as: :purchasable
  acts_as_list
  
end
