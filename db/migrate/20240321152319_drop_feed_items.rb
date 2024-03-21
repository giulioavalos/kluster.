class DropFeedItems < ActiveRecord::Migration[7.1]
  def change
    drop_table :feed_items
  end
end
