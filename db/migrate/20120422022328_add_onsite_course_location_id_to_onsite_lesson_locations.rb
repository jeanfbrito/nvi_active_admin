class AddOnsiteCourseLocationIdToOnsiteLessonLocations < ActiveRecord::Migration
  def up
    add_column :onsite_lesson_locations, :onsite_course_location_id, :integer
    add_index :onsite_lesson_locations, :onsite_course_location_id
    OnsiteLessonLocation.reset_column_information
    OnsiteLessonLocation.all.each do |oll|
      ocl = OnsiteCourseLocation.where(onsite_course_id: oll.onsite_lesson.onsite_course_id, location_id: oll.location_id).first
      oll.onsite_course_location = ocl
      oll.save
    end
  end

  def down
    remove_index :onsite_lesson_locations, :onsite_course_location_id
    remove_column :onsite_lesson_locations, :onsite_course_location_id
  end
end
