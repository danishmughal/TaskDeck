class RemoveColumnFromReminders < ActiveRecord::Migration
  def up
  	  	  	remove_column :reminders, :event_time

  end

  def down
  end
end
