class AddUserIdToTickets < ActiveRecord::Migration
  def change
    change_table :tickets do |f|
      f.references :users
    end
  end
end
