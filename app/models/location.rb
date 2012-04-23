class Location < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street_address, :zip_code, :country
  has_many :onsite_course_locations
  has_many :onsite_courses, through: :onsite_course_locations
  has_many :instructors, through: :onsite_course_locations
  has_many :onsite_lesson_locations
  has_many :onsite_lessons, through: :onsite_lesson_locations, order: :position
  after_save :touch_dependencies

  def touch_dependencies
    self.onsite_courses.each do |course|
      course.touch
    end
    self.onsite_lesson_locations.each do |oll|
      oll.touch
    end
    self.onsite_course_locations.each do |ocl|
      ocl.touch
    end
  end
  
end
