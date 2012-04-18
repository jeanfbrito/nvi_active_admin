class AddPositionToOnlineLessonsAndOnsiteLessons < ActiveRecord::Migration
  def change
    add_column :online_lessons, :position, :integer
    add_column :onsite_lessons, :position, :integer
    add_index :online_lessons, :position
    add_index :onsite_lessons, :position
  end
end
