class OnsiteLessonLocation < ActiveRecord::Base
  attr_accessible :location_id, :onsite_lesson_id, :seats_remaining, :start_time
  belongs_to :onsite_lesson
  belongs_to :location
  belongs_to :onsite_course_location

  def seats_available?
    self.seats_remaining > 0
  end
  
end
