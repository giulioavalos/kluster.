class AddImageToFavorite < ActiveRecord::Migration[7.1]
  def change
    add_column :favorites, :image, :string
  end
end
