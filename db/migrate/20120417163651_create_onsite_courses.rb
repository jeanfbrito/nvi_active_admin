class CreateOnsiteCourses < ActiveRecord::Migration
  def change
    create_table :onsite_courses do |t|
      t.string :title
      t.text :description
      t.integer :price_in_pennies, default: 0
      t.integer :down_payment_price_in_pennies, default: 200000
      t.integer :position
      t.integer :market_sector_id

      t.timestamps
    end
    add_index :onsite_courses, :position
    add_index :onsite_courses, :market_sector_id
  end
end
