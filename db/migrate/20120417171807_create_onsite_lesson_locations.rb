class CreateOnsiteLessonLocations < ActiveRecord::Migration
  def change
    create_table :onsite_lesson_locations do |t|
      t.integer :onsite_lesson_id
      t.integer :location_id
      t.integer :seats_remaining
      t.time :start_time

      t.timestamps
    end
    add_index :onsite_lesson_locations, :onsite_lesson_id
    add_index :onsite_lesson_locations, :location_id
  end
end
