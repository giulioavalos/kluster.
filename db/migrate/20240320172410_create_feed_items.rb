class CreateFeedItems < ActiveRecord::Migration[7.1]
  def change
    create_table :feed_items do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
