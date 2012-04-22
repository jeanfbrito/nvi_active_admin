class AddDateToOnsiteLessonLocations < ActiveRecord::Migration
  def change
    add_column :onsite_lesson_locations, :date, :date
  end
end
