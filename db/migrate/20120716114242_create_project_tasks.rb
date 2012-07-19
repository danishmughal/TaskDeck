class CreateProjectTasks < ActiveRecord::Migration
  def up
	    create_table :project_tasks do |t|
	      t.integer :project_id
	      t.integer :user_id
	      t.string :name
	      t.text :description
	      t.integer :percent_complete, default: 0
	      

	      t.datetime :completed_at

	      t.timestamps
	    end
  end


  def down
  end
end
