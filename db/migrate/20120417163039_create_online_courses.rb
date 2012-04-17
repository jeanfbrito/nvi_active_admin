class CreateOnlineCourses < ActiveRecord::Migration
  def change
    create_table :online_courses do |t|
      t.string :title
      t.text :description
      t.integer :price_in_pennies
      t.integer :position
      t.integer :market_sector_id
      t.integer :instructor_id

      t.timestamps
    end
    add_index :online_courses, :position
    add_index :online_courses, :market_sector_id
    add_index :online_courses, :instructor_id
  end
end
