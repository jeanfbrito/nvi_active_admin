class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :purchasable_id
      t.string :purchasable_type
      t.integer :cart_id

      t.timestamps
    end
    add_index :line_items, :purchasable_id
    add_index :line_items, :cart_id
  end
end
