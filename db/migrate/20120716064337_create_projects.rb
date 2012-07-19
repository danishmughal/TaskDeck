class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :team_id
      t.string :name
      t.text :description
      

      t.datetime :completed_at

      t.timestamps
    end
  end
end
