class AddDefaultToPriceInPenniesOnOnsiteLessons < ActiveRecord::Migration
  def up
    change_column :onsite_lessons, :price_in_pennies, :integer, default: 0
  end

  def down
    change_column :onsite_lessons, :price_in_pennies, :integer
  end
end
