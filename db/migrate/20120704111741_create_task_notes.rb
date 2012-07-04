class CreateTaskNotes < ActiveRecord::Migration
  def change
    create_table :task_notes do |t|
      t.integer :task_id
      t.text :description
      t.integer :percent_complete
      t.timestamps
    end
  end
end
