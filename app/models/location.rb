class Location < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip_code
  has_many :onsite_course_locations
  has_many :onsite_courses, through: :onsite_course_locations
  has_many :instructors, through: :onsite_course_locations
  has_many :onsite_lesson_locations
  has_many :onsite_lessons, through: :onsite_lesson_locations, order: :position
  after_save :touch_dependencies

  def touch_dependencies
    self.courses.each do |course|
      course.touch
    end
  end
  
end
