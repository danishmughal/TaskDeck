class TeamsController < ApplicationController

	def teampanel
	end

	def new
		@team = Team.new
	end

	def create
		name = params[:team][:name]
		org = current_user.organization_id
		@team = Team.new(name: name, organization_id: org)
		if @team.save
			current_user.update_attribute(:team_id, @team.id)
			current_user.update_attribute(:team_leader, true)
			sign_in current_user
			flash[:success] = "Team successfully created"
			redirect_to '/teampanel'
		else
			flash[:error] = "Failure"
			render 'new'
		end
	end

	def deleteteam
		teamid = current_user.team_id
		users = User.where(team_id: teamid)
		users.each do |u|
			u.update_attribute(:team_id, nil)
			u.update_attribute(:team_pending, false)
			u.update_attribute(:team_leader, false)
			sign_in current_user
		end
		team = Team.find(teamid)
		team.delete
		flash[:success] = "Your team has been deleted."
		redirect_to '/teampanel'
	end

end
