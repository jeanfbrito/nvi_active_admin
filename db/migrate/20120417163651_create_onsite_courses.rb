class CreateOnsiteCourses < ActiveRecord::Migration
  def change
    create_table :onsite_courses do |t|
      t.string :title
      t.text :description
      t.integer :price_in_pennies
      t.integer :down_payment_price_in_pennies

      t.timestamps
    end
  end
end
