class AddSlugToMarketSectors < ActiveRecord::Migration
  def change
    add_column :market_sectors, :slug, :string
    add_index :market_sectors, :slug
  end
end
