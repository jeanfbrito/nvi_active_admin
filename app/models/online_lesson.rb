class OnlineLesson < ActiveRecord::Base
  attr_accessible :description, :online_course_id, :price_in_pennies, :title, :video_uid
  belongs_to :online_course
end
