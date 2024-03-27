class AddImageToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :image, :string
  end
end
