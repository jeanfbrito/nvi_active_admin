class OnsiteCourseLocation < ActiveRecord::Base
  attr_accessible :instructor_id, :location_id, :onsite_course_id
  belongs_to :location
  belongs_to :onsite_course
  belongs_to :instructor
  
end
