class RemoveTicketColumn < ActiveRecord::Migration
  def up
    change_table :tickets do |f|
      f.remove :projects_id
    end
  end

  def down
    change_table :tickets do |f|
      f.references :projects
    end
  end
end
