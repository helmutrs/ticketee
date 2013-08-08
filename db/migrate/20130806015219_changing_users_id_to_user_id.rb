class ChangingUsersIdToUserId < ActiveRecord::Migration
  def up
    add_column :tickets, :user_id, :integer
    remove_column :tickets, :users_id
  end

  def down
    remove_column :tickets, :user_id
    add_column    :tickets, users_id, :integer
  end
end
