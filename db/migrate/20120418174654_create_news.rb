class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :blurb
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
