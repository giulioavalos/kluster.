class RemoveAlbumFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reviews, :album
  end
end
