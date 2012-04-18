class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.boolean :completed, default: false

      t.timestamps
    end
    add_index :carts, :user_id
    add_index :carts, :completed
  end
end
