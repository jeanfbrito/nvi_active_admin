class CreateOnlineLessons < ActiveRecord::Migration
  def change
    create_table :online_lessons do |t|
      t.string :title
      t.text :description
      t.integer :price_in_pennies, default: 0
      t.string :video_uid
      t.integer :online_course_id

      t.timestamps
    end
    add_index :online_lessons, :online_course_id
  end
end
