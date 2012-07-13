class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.datetime :reminder_at
      t.datetime :event_time
      t.timestamps
    end
  end
end
