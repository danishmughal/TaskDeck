class RenameTypeInTaskNotes < ActiveRecord::Migration
  def up
  	rename_column :task_notes, :type, :task_type
  end

  def down
  end
end
