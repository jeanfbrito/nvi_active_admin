class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.text :bio
      t.string :profile_picture_uid
      t.string :profile_picture_name

      t.timestamps
    end
  end
end
