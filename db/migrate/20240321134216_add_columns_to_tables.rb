class AddColumnsToTables < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :spotify_item_id, :string
    add_column :reviews, :spotify_item_type, :string
    add_column :likes, :spotify_item_id, :string
    add_column :likes, :spotify_item_type, :string
    add_column :favorites, :spotify_item_id, :string
    add_column :favorites, :spotify_item_type, :string
  end
end
