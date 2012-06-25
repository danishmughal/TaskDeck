class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :organization_id
      t.boolean :admin, default: false
      t.integer :team_id
      t.boolean :team_leader, default: false
      t.timestamps
    end
  end
end