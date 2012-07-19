class AddTypeToTaskNotes < ActiveRecord::Migration
  def change
  	add_column :task_notes, :type, :string
  end
end
