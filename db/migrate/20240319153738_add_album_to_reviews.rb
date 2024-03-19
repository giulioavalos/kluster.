class AddAlbumToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :album, null: false, foreign_key: true
  end
end
