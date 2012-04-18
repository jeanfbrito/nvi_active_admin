class CreateOnsiteLessons < ActiveRecord::Migration
  def change
    create_table :onsite_lessons do |t|
      t.string :title
      t.text :description
      t.integer :price_in_pennies, default: 0
      t.integer :down_payment_price_in_pennies, default: 200000
      t.integer :onsite_course_id

      t.timestamps
    end
    add_index :onsite_lessons, :onsite_course_id
  end
end
