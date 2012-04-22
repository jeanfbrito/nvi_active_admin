class OnsiteCourseLocation < ActiveRecord::Base
  attr_accessible :instructor_id, :location_id, :onsite_course_id
  belongs_to :location
  belongs_to :onsite_course
  belongs_to :instructor
  has_many :onsite_lesson_locations
  after_create :add_to_lessons
  before_destroy :destroy_from_lessons

  def add_to_lessons
    lessons = self.onsite_course.onsite_lessons
    lessons.each do |lesson|
      lesson.locations << self.location
    end
  end

  def destroy_from_lessons
    lessons = self.onsite_course.onsite_lessons
    lessons.each do |lesson|
      lesson.locations.delete(self.location)
    end
  end

  def start_date
    self.onsite_lesson_locations.order('date').first.date
  end

  def end_date
    self.onsite_lesson_locations.order('date desc').first.date
  end

end
