class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.references Project

      t.timestamps
    end
  end
end
