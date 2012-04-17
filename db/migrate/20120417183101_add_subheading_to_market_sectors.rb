class AddSubheadingToMarketSectors < ActiveRecord::Migration
  def change
    add_column :market_sectors, :subheading, :string
  end
end
