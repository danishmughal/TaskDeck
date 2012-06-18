class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.text :full_name
      t.string :username
      t.string :password
      t.timestamps
    end
  end
end