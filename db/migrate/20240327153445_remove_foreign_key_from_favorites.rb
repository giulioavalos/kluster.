class RemoveForeignKeyFromFavorites < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :favorites, column: :review_id
  end
end
