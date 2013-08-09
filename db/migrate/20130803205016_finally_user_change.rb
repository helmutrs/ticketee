class FinallyUserChange < ActiveRecord::Migration
  def up
    change_table :tickets do |f|
      f.remove :projects_id
      f.references :project
    end
  end

  def down
    change_table :tickets do |f|
      f.remove :project_id
      f.references :projects
    end
  end
end
