class Location < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip_code
  has_many :onsite_course_locations
  has_many :onsite_courses, through: :onsite_course_locations
  has_many :instructors, through: :onsite_course_locations
  
end
