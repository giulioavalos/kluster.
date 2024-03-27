class RemoveReviewIdFromFavorites < ActiveRecord::Migration[7.1]
  def change
    remove_column :favorites, :review_id
  end
end
