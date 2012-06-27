class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :name
      t.text :description
      t.integer :user_id
      t.boolean :approved, default: false
      t.integer :percent_complete
      t.timestamps
    end
  end
end