class AddPriceInPenniesToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :price_in_pennies, :integer, default: 0
  end
end
