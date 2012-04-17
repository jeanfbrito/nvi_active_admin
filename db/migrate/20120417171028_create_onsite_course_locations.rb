class CreateOnsiteCourseLocations < ActiveRecord::Migration
  def change
    create_table :onsite_course_locations do |t|
      t.integer :onsite_course_id
      t.integer :location_id
      t.integer :instructor_id

      t.timestamps
    end
    add_index :onsite_course_locations, :onsite_course_id
    add_index :onsite_course_locations, :location_id
    add_index :onsite_course_locations, :instructor_id
  end
end
