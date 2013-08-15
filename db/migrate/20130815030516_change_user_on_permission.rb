class ChangeUserOnPermission < ActiveRecord::Migration
  def up
    add_column :permissions, :user_id, :integer
    remove_column :permissions, :users_id
  end

  def down
    remove_column :permissions, :user_id
    add_column    :permissions, users_id, :integer
  end
end
