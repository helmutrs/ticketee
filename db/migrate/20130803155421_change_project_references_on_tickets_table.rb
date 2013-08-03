class ChangeProjectReferencesOnTicketsTable < ActiveRecord::Migration
  def up
    change_table :tickets do |f|
      f.remove :Project_id
      f.references :projects
    end
  end

  def down
    change_table :tickets do |f|
      f.remove :project_id
      f.references Project
    end
  end
end
