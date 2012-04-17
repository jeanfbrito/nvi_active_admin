class CreateMarketSectors < ActiveRecord::Migration
  def change
    create_table :market_sectors do |t|
      t.string :name
      t.text :blurb
      t.text :body

      t.timestamps
    end
  end
end
