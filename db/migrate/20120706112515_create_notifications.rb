class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :description
      t.text :target #To specify the URL where the notification would take you upon clicking.
      t.boolean :seen
      t.timestamps
    end
  end
end
