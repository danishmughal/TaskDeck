class AddTeamPendingToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :team_pending, :boolean, default: false
  end
end
