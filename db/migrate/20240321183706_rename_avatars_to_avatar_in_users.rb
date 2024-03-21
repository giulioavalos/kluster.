class RenameAvatarsToAvatarInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :avatars, :avatar 
  end
end
