class RemoveReviewFromFavorites < ActiveRecord::Migration[7.1]
  def change
    remove_reference :favorites, :review
  end
end
