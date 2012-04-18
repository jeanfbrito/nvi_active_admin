class AddDefaultToPriceInPenniesOnOnlineLessons < ActiveRecord::Migration
  def change
    change_column :online_lessons, :price_in_pennies, :integer, default: 0
  end
end
