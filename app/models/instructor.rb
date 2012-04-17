class Instructor < ActiveRecord::Base
  attr_accessible :bio, :name, :profile_picture_name, :profile_picture_uid
  has_many :online_courses
  has_many :onsite_course_locations
  has_many :onsite_courses, through: :onsite_course_locations
  has_many :locations, through: :onsite_course_locations
end
