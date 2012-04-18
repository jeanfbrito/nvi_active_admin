class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.text :description
      t.boolean :active
      t.string :contact_email

      t.timestamps
    end
  end
end
