class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :spotify_id, :string
    add_column :users, :birthdate, :date
    add_column :users, :country, :string
    add_column :users, :name, :string
  end
end
